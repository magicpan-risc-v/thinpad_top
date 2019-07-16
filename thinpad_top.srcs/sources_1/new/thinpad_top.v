`default_nettype none

module thinpad_top(
    input wire clk_50M,           //50MHz 时钟输入
    input wire clk_11M0592,       //11.0592MHz 时钟输入

    input wire clock_btn,         //BTN5手动时钟按钮开关，带消抖电路，按下时为1
    input wire reset_btn,         //BTN6手动复位按钮开关，带消抖电路，按下时为1

    input  wire[3:0]  touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时为1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //CPLD串口控制器信号
    output wire uart_rdn,         //读串口信号，低有效
    output wire uart_wrn,         //写串口信号，低有效
    input wire uart_dataready,    //串口数据准备好
    input wire uart_tbre,         //发送数据标志
    input wire uart_tsre,         //数据发送完毕标志

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
    output wire ext_ram_we_n,       //ExtRAM写使能，低有效

    //直连串口信号
    output wire txd,  //直连串口发送端
    input  wire rxd,  //直连串口接收端

    //Flash存储器信号，参考 JS28F640 芯片手册
    output wire [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    inout  wire [15:0]flash_d,      //Flash数据
    output wire flash_rp_n,         //Flash复位信号，低有效
    output wire flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧写
    output wire flash_ce_n,         //Flash片选信号，低有效
    output wire flash_oe_n,         //Flash读使能信号，低有效
    output wire flash_we_n,         //Flash写使能信号，低有效
    output wire flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1

    //USB 控制器信号，参考 SL811 芯片手册
    output wire sl811_a0,
    //inout  wire[7:0] sl811_d,     //USB数据线与网络控制器的dm9k_sd[7:0]共享
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    //网络控制器信号，参考 DM9000A 芯片手册
    output wire dm9k_cmd,
    inout  wire[15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input  wire dm9k_int,

    //图像输出信号
    output wire[2:0] video_red,    //红色像素，3位
    output wire[2:0] video_green,  //绿色像素，3位
    output wire[1:0] video_blue,   //蓝色像素，2位
    output wire video_hsync,       //行同步（水平同步）信号
    output wire video_vsync,       //场同步（垂直同步）信号
    output wire video_clk,         //像素时钟输出
    output wire video_de           //行数据有效信号，用于区分消隐区
);


/* =========== Demo code begin =========== */

// PLL分频示例
wire locked, clk_10M, clk_20M;
pll_example clock_gen 
 (
  // Clock out ports
  .clk_out1(clk_10M), // 时钟输出1，频率在IP配置界面中设置
  .clk_out2(clk_20M), // 时钟输出2，频率在IP配置界面中设置
  // Status and control signals
  .reset(reset_btn), // PLL复位输入
  .locked(locked), // 锁定输出，"1"表示时钟稳定，可作为后级电路复位
 // Clock in ports
  .clk_in1(clk_50M) // 外部时钟输入
 );

reg reset_of_clk10M;
// 异步复位，同步释放
always@(posedge clk_10M or negedge locked) begin
	if(~locked) reset_of_clk10M <= 1'b1;
	else        reset_of_clk10M <= 1'b0;
end

//always@(posedge clk_10M or posedge reset_of_clk10M) begin
    //if(reset_of_clk10M)begin
        //// Your Code
    //end
    //else begin
        //// Your Code
    //end
//end

// 数码管连接关系示意图，dpy1同理
// p=dpy0[0] // ---a---
// c=dpy0[1] // |     |
// d=dpy0[2] // f     b
// e=dpy0[3] // |     |
// b=dpy0[4] // ---g---
// a=dpy0[5] // |     |
// f=dpy0[6] // e     c
// g=dpy0[7] // |     |
//           // ---d---  p

// 7段数码管译码器演示，将number用16进制显示在数码管上面
reg[7:0] number;
SEG7_LUT segL(.oSEG1(dpy0), .iDIG(number[3:0])); //dpy0是低位数码管
SEG7_LUT segH(.oSEG1(dpy1), .iDIG(number[7:4])); //dpy1是高位数码管

reg[15:0] led_bits;
assign leds = led_bits;

always@(posedge clock_btn or posedge reset_btn) begin
    if(reset_btn)begin //复位按下，设置LED和数码管为初始值
        number<=0;
    end
end

//直连串口接收发送演示，从直连串口收到的数据再发送出去
wire [7:0] ext_uart_rx;	// 从串口读出的数据
reg  [7:0] ext_uart_buffer;		// 从串口数据的缓冲区
reg	 [7:0] ext_uart_tx;	// 要写入串口的数据
wire ext_uart_ready;	// 串口中有数据准备好被读出
wire ext_uart_busy;		// 串口正在写入数据
reg ext_uart_start;		// 开始发送信号
reg ext_uart_avai;		// 串口可获得？低有效？

always @(posedge clk_50M) begin //接收到缓冲区ext_uart_buffer
	if(ext_uart_ready)begin	// 有可以接收的数据
		ext_uart_buffer <= ext_uart_rx;
		ext_uart_avai <= 1;
	end else if(!ext_uart_busy && ext_uart_avai)begin 
		ext_uart_avai <= 0;
	end
end
always @(posedge clk_50M) begin //将缓冲区ext_uart_buffer发送出去
	if(!ext_uart_busy && ext_uart_avai)begin 
		ext_uart_tx <= ext_uart_buffer;
		ext_uart_start <= 1;
	end else begin 
		ext_uart_start <= 0;
	end
end

serial serial0(
	.clk(clk_50M),
	.rxd(rxd),
	.txd(txd),
	.ext_uart_wrn(ext_uart_start),
	.ext_uart_ready(ext_uart_ready),
	.ext_uart_busy(ext_uart_busy),
	.rdata(ext_uart_rx),
	.wdata(ext_uart_tx)
);

//图像输出演示，分辨率800x600@75Hz，像素时钟为50MHz
//wire [11:0] hdata;
//assign video_red = hdata < 266 ? 3'b111 : 0; //红色竖条
//assign video_green = hdata < 532 && hdata >= 266 ? 3'b111 : 0; //绿色竖条
//assign video_blue = hdata >= 532 ? 2'b11 : 0; //蓝色竖条
//assign video_clk = clk_50M;
//vga #(12, 800, 856, 976, 1040, 600, 637, 643, 666, 1, 1) vga800x600at75 (
    //.clk(clk_50M), 
    //.hdata(hdata), //横坐标
    //.vdata(),      //纵坐标
    //.hsync(video_hsync),
    //.vsync(video_vsync),
    //.data_enable(video_de)
//);
/* =========== Demo code end =========== */

// 在这里定义wire/reg/parameter
//   关于串口控制器
reg  [63:0] ram_addr_buf;	// 访存地址
reg  [ 3:0] ram_mode_buf;	// 访存模式
reg  [63:0] ram_rdata_buf;	// 访存读出数据
reg  [63:0]	ram_wdata_buf;	// 访存写入数据
wire [63:0] ram_addr = ram_addr_buf;	// 访存地址
wire [ 3:0] ram_mode = ram_mode_buf;	// 访存模式
wire [63:0] ram_rdata = ram_rdata_buf;	// 访存读出数据
wire [63:0]	ram_wdata = ram_wdata_buf;	// 访存写入数据

ram ram(
	//与Chisel之间的接口
	.clk(clk_50M),
	.addr(ram_addr),			// 访存地址，低22位有效
	.rdata(ram_rdata),		// 读出的数据
	.wdata(ram_wdata),		// 写入的数据
	.mode(ram_mode),			// 访存模式

	//BaseRAM信号
	.base_ram_data(base_ram_data),  //BaseRAM数据，低8位与CPLD串口控制器共享
	.base_ram_addr(base_ram_addr), //BaseRAM地址
	.base_ram_be_n(base_ram_be_n),  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
	.base_ram_ce_n(base_ram_ce_n),       //BaseRAM片选，低有效
	.base_ram_oe_n(base_ram_oe_n),       //BaseRAM读使能，低有效
	.base_ram_we_n(base_ram_we_n),       //BaseRAM写使能，低有效

	//ExtRAM信号
	.ext_ram_data(ext_ram_data),  //ExtRAM数据
	.ext_ram_addr(ext_ram_addr), //ExtRAM地址
	.ext_ram_be_n(ext_ram_be_n),  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持为0
	.ext_ram_ce_n(ext_ram_ce_n),       //ExtRAM片选，低有效
	.ext_ram_oe_n(ext_ram_oe_n),       //ExtRAM读使能，低有效
	.ext_ram_we_n(ext_ram_we_n)       //ExtRAM写使能，低有效
);

always @ (posedge clk_50M)begin
	if(number != {8{1'b1}})begin
		number <= number + 1;
		ram_addr_buf <= ram_addr_buf + 1;
		ram_mode_buf <= 4'b0000;
		ram_wdata_buf <= ram_wdata_buf + 1;
	end
end;

endmodule
