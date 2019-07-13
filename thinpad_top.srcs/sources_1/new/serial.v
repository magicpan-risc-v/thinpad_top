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
	input wire clk,				// 时钟输入
	input wire rxd,				// 串行信号输入
	output wire txd,			// 串行信号输出

    input wire ext_uart_wrn,         //写串口信号，低有效
    output wire ext_uart_ready,      //有可被读取的串口数据准备好
	output wire ext_uart_busy,		// 串口当前正在写入数据


	output wire [7:0] rdata,	// 从串口读出的数据
	input  wire [7:0] wdata		// 写入到串口的数据
);

reg [7:0] lock_wdata;	// 锁住要写入的数据
always @ (wdata)begin
	lock_wdata <= wdata;
end;

async_receiver #(.ClkFrequency(50000000),.Baud(9600)) //接收模块，9600无检验位
    ext_uart_r(
        .clk(clk),                       //外部时钟信号
        .RxD(rxd),                       //外部串行信号输入
        .RxD_data_ready(ext_uart_ready), //数据接收到标志
        .RxD_clear(ext_uart_ready),	     //清除接收标志
        .RxD_data(rdata)				 //接收到的一字节数据
    );

async_transmitter #(.ClkFrequency(50000000),.Baud(9600)) //发送模块，9600无检验位
    ext_uart_t(
        .clk(clk),                  //外部时钟信号
        .TxD(txd),                      //串行信号输出
        .TxD_busy(ext_uart_busy),       //发送器忙状态指示
        .TxD_start(ext_uart_wrn),    //开始发送信号
        .TxD_data(lock_wdata)        //待发送的数据
    );

endmodule
