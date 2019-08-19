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

/*
module serial(
	input wire clk,				// 时钟输入

	input wire [63:0] addr,
	output wire ready,
	output wire [63:0] rdata,
	input wire [63:0] wdata,
	input wire [3:0] mode,
	
	input wire rxd,				// 串行信号输入
	output wire txd			// 串行信号输出
);
*/
module serial(
    input wire clk,
    input wire [63:0] addr,
    output wire ready,
    output wire [63:0] rdata,
    input wire [63:0] wdata,
    input wire [3:0] mode,
    output wire[15:0] debug_out,
    input wire rxd,
    output wire txd
  );
  
parameter ClkFrequency = 10000000;	// 10MHz
  
reg [3:0] lock_mode;
reg [7:0] lock_wdata;	// 锁住要写入的数据
/*
always @ (posedge clk)begin
	lock_wdata <= wdata[7:0];
end
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


wire is_write = ~lock_mode[3];
wire is_read = lock_mode[3] && (lock_mode != NOP);

//直连串口接收发�?�演示，从直连串口收到的数据再发送出�?
wire [7:0] ext_uart_rx;	// 从串口读出的数据
reg  [7:0] ext_uart_buffer;		// 从串口数据的缓冲�?
reg	 [7:0] ext_uart_tx;	// 要写入串口的数据
wire ext_uart_ready;	// 串口中有数据准备好被读出
wire ext_uart_busy;		// 串口正在写入数据
reg ext_uart_start;		// �?始发送信�?
reg ext_uart_avai;		// 串口可获得？低有效？

always @ (posedge clk)begin
    if (lock_mode == 4'b1111) begin
	   lock_mode <= mode;
	   lock_wdata <= wdata[7:0];
	end else begin
	   if (ext_uart_start == 1 || ext_uart_avai == 1) begin
	       lock_mode <= 4'b1111;
	   end
	end
end


assign rdata = {{56{1'b0}}, ext_uart_buffer};
assign ready = 
		is_write ? ext_uart_start :
		is_read ? ext_uart_avai :
		1'b1;

reg[6:0] rxd_cnt;
reg[6:0] txd_cnt;

always @(posedge clk) begin //接收到缓冲区ext_uart_buffer
	if (ext_uart_ready) begin
	   if (rxd_cnt[6]) begin
	       ext_uart_avai <= 1;
	       ext_uart_buffer <= ext_uart_rx;
	       rxd_cnt <= 0;
	   end else begin
	       rxd_cnt <= rxd_cnt + 1;
	       ext_uart_avai <= 0;
	   end
	end else begin
	   if (! rxd_cnt[6]) begin
	       rxd_cnt <= rxd_cnt + 1;
	   end
	   ext_uart_avai <= 0;
	end
	/*
	if (ext_uart_avai) begin
	   ext_uart_avai <= 0;
	end else if (ext_uart_ready) begin
	   ext_uart_buffer <= ext_uart_rx;
	   ext_uart_avai <= 1;
	end
	
	if(ext_uart_ready)begin	// 有可以接收的数据
		ext_uart_buffer <= ext_uart_rx;
		ext_uart_avai <= 1;
	end else if(ext_uart_avai)begin 
		ext_uart_avai <= 0;
	end
	
	*/
end

always @(posedge clk) begin //将缓冲区ext_uart_buffer发�?�出�?
	if(!ext_uart_busy && is_write)begin
	   if (txd_cnt[6]) begin
	       ext_uart_tx <= lock_wdata;
	       ext_uart_start <= 1;
	       txd_cnt <= 0;
	   end else begin
	       txd_cnt <= txd_cnt + 1;
	       ext_uart_start <= 0;
	   end
	end else begin
	   if (! txd_cnt[6]) begin
	       txd_cnt <= txd_cnt + 1;
	   end 
	   ext_uart_start <= 0;
	end
end

assign debug_out = {ext_uart_ready, ext_uart_busy, ext_uart_start, ext_uart_avai, ~mode, ~lock_mode,txd_cnt[6:5], rxd_cnt[6:5]};

async_receiver #(.ClkFrequency(ClkFrequency),.Baud(9600)) //接收模块�?9600无检验位
    ext_uart_r(
        .clk(clk),                       //外部时钟信号
        .RxD(rxd),                       //外部串行信号输入
        .RxD_data_ready(ext_uart_ready), //数据接收到标�?
        .RxD_clear(ext_uart_ready),	     //清除接收标志
        .RxD_data(ext_uart_rx)				 //接收到的�?字节数据
    );

async_transmitter #(.ClkFrequency(ClkFrequency),.Baud(9600)) //发�?�模块，9600无检验位
    ext_uart_t(
        .clk(clk),                  //外部时钟信号
        .TxD(txd),                      //串行信号输出
        .TxD_busy(ext_uart_busy),       //发�?�器忙状态指�?
        .TxD_start(ext_uart_start),    //�?始发送信�?
        .TxD_data(ext_uart_tx)        //待发送的数据
    );

endmodule
