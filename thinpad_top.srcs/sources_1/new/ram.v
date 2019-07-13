`default_nettype none

/*
* 高32位存在BaseRAM中，低32位存在ExtRAM中
* 要写入的1Byte位于wdata的低8位，2Byte位于wdata的低16位，4Byte位于wdata的低一半。读出时同理
*/
module ram (
	input wire clk,					//时钟信号
	
	input wire [63:0] addr,			// 访存地址，低22位有效
	output wire [63:0] rdata,		// 读出的数据
	input wire [63:0] wdata,		// 写入的数据
	input wire [3:0] mode,			// 访存模式
	output wire ok,					// 操作是否已经完成

    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共享
    output wire[19:0] base_ram_addr, //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output wire base_ram_ce_n,       //BaseRAM片选，低有效
    output wire base_ram_oe_n,       //BaseRAM读使能，低有效
    output wire base_ram_we_n,       //BaseRAM写使能，低有效

    //ExtRAM信号
    inout wire[31:0] ext_ram_data,  //ExtRAM数据
    output wire[19:0] ext_ram_addr, //ExtRAM地址
    output wire[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output wire ext_ram_ce_n,       //ExtRAM片选，低有效
    output wire ext_ram_oe_n,       //ExtRAM读使能，低有效
    output wire ext_ram_we_n       //ExtRAM写使能，低有效
);

// mode
/*
* 最高位代表读/写
* [2:0]根据inst中的width域来区分，方便流水线直接使用（is it ok？fix me）
* 特殊情况，全1代表什么都不做
*/
parameter NOP = 4'b1111;
parameter LB  = 4'b1000;
parameter LBU = 4'b1100;
parameter LH  = 4'b1001;
parameter LHU = 4'b1101;
parameter LW  = 4'b1010;
parameter LWU = 4'b1110;
parameter LD  = 4'b1011;
parameter SB  = 4'b0000;
parameter SH  = 4'b0001;
parameter SW  = 4'b0010;
parameter SD  = 4'b0011;

reg [63:0] lock_addr;
reg [3:0]  lock_mode;
reg [63:0] lock_wdata;

always @ (posedge clk) begin	// 当时钟信号上升沿到来
	lock_addr  <= addr;
	lock_mode  <= mode;
	lock_wdata <= wdata;
end

// Decide op type
wire use_all_word = lock_mode == LD || lock_mode == SD;
wire is_write = ~lock_mode[3];
wire is_read  = lock_mode[3] && (lock_mode != NOP);

wire chip_selbase_n  = lock_addr[2];
wire [19:0] word_sel = lock_addr[22:3];
wire [1:0] byte_sel  = lock_addr[1:0];
wire access_base = chip_selbase_n || use_all_word;
wire access_ext  = ~chip_selbase_n;

wire [3:0] be = 
	(lock_mode == SH || lock_mode == LH || lock_mode == LHU) ? 
		(byte_sel[1]? 4'b0011 : 4'b1100) :
	(lock_mode == SB || lock_mode == LB || lock_mode == LBU) ?
		~(1 << byte_sel) :
	/*LW, LWU, SW, LD, SD, NOP */4'b0000;

// 设置BaseRAM片选
assign base_ram_ce_n = access_base;
assign ext_ram_ce_n  = access_ext;

// 设置RAM访存地址
assign base_ram_addr = word_sel;
assign ext_ram_addr = word_sel;

// 设置读使能
assign base_ram_oe_n = ~is_read;
assign ext_ram_oe_n = ~is_read;

// 设置写使能
assign base_ram_we_n = is_write ? clk : 1;
assign ext_ram_we_n  = is_write ? clk : 1;

// 设置BaseRAM字节使能
assign base_ram_be_n = be;
assign ext_ram_be_n  = be;

// 待写入数据的设定
assign base_ram_data = 
	(access_base && is_write)? 
		(use_all_word ? lock_wdata[63:32] : lock_wdata[31:0]<<(8 * byte_sel)) :
	/*当前并不处理该BaseRAM*/{32{1'bz}};
assign ext_ram_data  = (access_ext && is_write)? lock_wdata[31:0]<<(8 * byte_sel) : {32{1'bz}};

// 待读出数据的设定
wire [63:0] rdata_raw = {base_ram_data, ext_ram_data};
assign rdata = (rdata_raw >> (32 * chip_selbase_n)) >> (8 * byte_sel);

assign ok = is_read || is_write;

endmodule
