`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2019 12:23:43 PM
// Design Name: 
// Module Name: serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serial(
	input wire clk,	// 时钟输入
	input wire [31:0] addr,	// 物理地址
	input wire [3:0] mode,	// 访存模式
	input wire [31:0] wdata,	// 写数据
	output wire [31:0] rdata,	// 读数据
	output wire ok,	// 操作是否完成

    //CPLD串口控制器信号
    output wire uart_rdn,         //读串口信号，低有效
    output wire uart_wrn,         //写串口信号，低有效
    input wire uart_dataready,    //串口数据准备好
    input wire uart_tbre,         //发送数据标志
    input wire uart_tsre,         //数据发送完毕标志

	//BaseRAM
	inout wire[7:0] base_ram_data,//BaseRAM数据低8位,与串口共享
	output wire base_ram_ce_n	  //BaseRAM片选，默认为低，读写串口时为高
								  //由于要输入到RAM，因此延迟应尽量低
);

parameter NOP = 4'b0000;
parameter LB = 4'b0100;
parameter LBU = 4'b0101;
parameter SB = 4'b1100;

wire can_read	= uart_dataready;	// 有数据可读
wire can_write	= uart_tbre &&  uart_tsre;	// 有数据要写入且可写

reg [2:0] lock_addr;
reg [3:0] lock_mode;
reg [7:0] lock_wdata;
reg lock_can_read;
reg lock_can_write;

always @(posedge clk) begin
	lock_addr <= addr[2:0];
	lock_mode <= mode;
	lock_wdata <= wdata[7:0];
	lock_can_read <= can_read;
	lock_can_write <= can_write;
end;

wire is_read	= lock_addr == 0 && lock_can_read && (~lock_mode[3] && (lock_mode != NOP));
wire is_write	= lock_addr == 0 && lock_can_write && lock_mode[3];
wire is_test    = lock_addr == 5 && (lock_mode == LB || lock_mode == LBU);
wire [7:0] status   = (lock_can_write << 5) | lock_can_read;

assign uart_wrn = is_write? clk : 1;
assign uart_rdn = ~is_read;
assign base_ram_data = is_write? lock_wdata: {8{1'bz}};
assign base_ram_ce_n = lock_addr == 0 && lock_mode != NOP;

wire [7:0] rdata_raw = 
	is_test? status:
	is_read? base_ram_data: 0;
// 符号拓展或0拓展
assign rdata = {{24{lock_mode == LB && rdata_raw[7]}}, rdata_raw};

assign ok = lock_mode != NOP;

endmodule
