`default_nettype wire

module thinpad_top(
    input wire clk_50M,           //50MHz 时钟输入
    input wire clk_11M0592,       //11.0592MHz 时钟输入

    input wire clock_btn,         //BTN5手动时钟按钮�?关，带消抖电路，按下时为1
    input wire reset_btn,         //BTN6手动复位按钮�?关，带消抖电路，按下时为1

    input  wire[3:0]  touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时�?1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //CPLD串口控制器信�?
    output wire uart_rdn,         //读串口信号，低有�?
    output wire uart_wrn,         //写串口信号，低有�?
    input wire uart_dataready,    //串口数据准备�?
    input wire uart_tbre,         //发�?�数据标�?
    input wire uart_tsre,         //数据发�?�完毕标�?

    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共�?
    output wire[19:0] base_ram_addr, //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�?0
    output wire base_ram_ce_n,       //BaseRAM片�?�，低有�?
    output wire base_ram_oe_n,       //BaseRAM读使能，低有�?
    output wire base_ram_we_n,       //BaseRAM写使能，低有�?

    //ExtRAM信号
    inout wire[31:0] ext_ram_data,  //ExtRAM数据
    output wire[19:0] ext_ram_addr, //ExtRAM地址
    output wire[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0
    output wire ext_ram_ce_n,       //ExtRAM片�?�，低有�?
    output wire ext_ram_oe_n,       //ExtRAM读使能，低有�?
    output wire ext_ram_we_n,       //ExtRAM写使能，低有�?

    //直连串口信号
    output wire txd,  //直连串口发�?�端
    input  wire rxd,  //直连串口接收�?

    //Flash存储器信号，参�?? JS28F640 芯片手册
    output wire [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效�?16bit模式无意�?
    inout  wire [15:0]flash_d,      //Flash数据
    output wire flash_rp_n,         //Flash复位信号，低有效
    output wire flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧�?
    output wire flash_ce_n,         //Flash片�?�信号，低有�?
    output wire flash_oe_n,         //Flash读使能信号，低有�?
    output wire flash_we_n,         //Flash写使能信号，低有�?
    output wire flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash�?16位模式时请设�?1

    //USB 控制器信号，参�?? SL811 芯片手册
    output wire sl811_a0,
    //inout  wire[7:0] sl811_d,     //USB数据线与网络控制器的dm9k_sd[7:0]共享
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    //网络控制器信号，参�?? DM9000A 芯片手册
    output wire dm9k_cmd,
    inout  wire[15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input  wire dm9k_int,

    //图像输出信号
    output wire[2:0] video_red,    //红色像素�?3�?
    output wire[2:0] video_green,  //绿色像素�?3�?
    output wire[1:0] video_blue,   //蓝色像素�?2�?
    output wire video_hsync,       //行同步（水平同步）信�?
    output wire video_vsync,       //场同步（垂直同步）信�?
    output wire video_clk,         //像素时钟输出
    output wire video_de           //行数据有效信号，用于区分消隐�?
);


// PLL分频示例
wire locked, clk_10M, clk_20M;
pll_example clock_gen 
 (
  // Clock out ports
  .clk_out1(clk_10M), // 时钟输出1，频率在IP配置界面中设�?
  .clk_out2(clk_20M), // 时钟输出2，频率在IP配置界面中设�?
  // Status and control signals
  .reset(reset_btn), // PLL复位输入
  .locked(locked), // 锁定输出�?"1"表示时钟稳定，可作为后级电路复位
 // Clock in ports
  .clk_in1(clk_50M) // 外部时钟输入
 );

reg reset_of_clk10M;
// 异步复位，同步释�?
always@(posedge clk_10M or negedge locked) begin
	if(~locked) reset_of_clk10M <= 1'b1;
	else        reset_of_clk10M <= 1'b0;
end

reg reset_of_clk20M;
always@(posedge clk_20M or negedge locked) begin
	if(~locked) reset_of_clk20M <= 1'b1;
	else        reset_of_clk20M <= 1'b0;
end

wire clock;
wire reset;
//assign clock=clk_50M;
//assign reset=reset_btn;
//assign clock=clk_10M;
//assign reset=reset_of_clk10M;
assign clock=clk_20M;
assign reset=reset_of_clk20M;
//assign clock = clock_btn;
//assign reset = reset_btn;

wire CPUclk;
assign CPUclk=clock;

wire [63:0] debug_pc;
wire [31:0] debug_ins;
wire [1:0] debug_if_wait;
wire [1:0] debug_mem_wait;
wire debug_if_ready;
wire debug_mem_ready;
wire [3:0] debug_if_mode;
wire [3:0] debug_mem_mode;
wire [63:0] debug_if_addr;
wire [63:0] debug_mem_addr;
wire debug_if_error;
wire debug_mem_error;

wire [ 3:0] mem_mode;
wire mem_ready;
wire [63:0] mem_addr;
wire [63:0] mem_rdata;
wire [63:0] mem_wdata;
wire [ 3:0] serial_mode;
wire serial_ready;
wire [63:0] serial_addr;
wire [63:0] serial_rdata;
wire [63:0] serial_wdata;

CPU CPU_c(
    .clock(CPUclk),
    .reset(reset),
    .io_en(1),
    .io_debug_pc(debug_pc),
    .io_debug_ins(debug_ins),
    .io_debug_if_wait(debug_if_wait),
    .io_debug_mem_wait(debug_mem_wait),
    .io_debug_if_ready(debug_if_ready),
    .io_debug_mem_ready(debug_mem_ready),
    .io_debug_if_mode(debug_if_mode),
    .io_debug_mem_mode(debug_mem_mode),
    .io_debug_if_addr(debug_if_addr),
    .io_debug_mem_addr(debug_mem_addr),
    .io_debug_if_error(debug_if_error),
    .io_debug_mem_error(debug_mem_error),
    .io_mem_mode(mem_mode),
    .io_mem_ready(mem_ready),
    .io_mem_addr(mem_addr),
    .io_mem_rdata(mem_rdata),
    .io_mem_wdata(mem_wdata),
    .io_serial_mode(serial_mode),
    .io_serial_ready(serial_ready),
    .io_serial_addr(serial_addr),
    .io_serial_rdata(serial_rdata),
    .io_serial_wdata(serial_wdata)
);

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

// 7段数码管译码器演示，将number�?16进制显示在数码管上面
reg[7:0] number;
SEG7_LUT segL(.oSEG1(dpy0), .iDIG(number[3:0])); //dpy0是低位数码管
SEG7_LUT segH(.oSEG1(dpy1), .iDIG(number[7:4])); //dpy1是高位数码管

//reg[15:0] led_bits;
//assign leds = led_bits;

wire [7:0] sw = dip_sw[7:0];
            

always@ (posedge clock or posedge reset) begin
    if (reset) begin
        number <= 0;
    end else begin
        number <= debug_pc[7:0];
    end
end

wire [15:0] serial_debug_out;

serial #(.ClkFrequency(20000000)) serial0(
	.clk(clock),
	.addr(serial_addr),
	.ready(serial_ready),
	.rdata(serial_rdata),
	.wdata(serial_wdata),
	.mode(serial_mode),
	
	.debug_out(serial_debug_out),

	.rxd(rxd),
	.txd(txd)
);

//图像输出演示，分辨率800x600@75Hz，像素时钟为50MHz
//wire [11:0] hdata;
//assign video_red = hdata < 266 ? 3'b111 : 0; //红色竖条
//assign video_green = hdata < 532 && hdata >= 266 ? 3'b111 : 0; //绿色竖条
//assign video_blue = hdata >= 532 ? 2'b11 : 0; //蓝色竖条
//assign video_clk = clk_50M;
//vga #(12, 800, 856, 976, 1040, 600, 637, 643, 666, 1, 1) vga800x600at75 (
    //.clk(clk_50M), 
    //.hdata(hdata), //横坐�?
    //.vdata(),      //纵坐�?
    //.hsync(video_hsync),
    //.vsync(video_vsync),
    //.data_enable(video_de)
//);

ram ram0(
	//与Chisel之间的接�?
	.clk(clock),
	.addr(mem_addr),			// 访存地址，低22位有�?
	.ready(mem_ready),
	.rdata(mem_rdata),		// 读出的数�?
	.wdata(mem_wdata),		// 写入的数�?
	.mode(mem_mode),			// 访存模式

	//BaseRAM信号
	.base_ram_data(base_ram_data),  //BaseRAM数据，低8位与CPLD串口控制器共�?
	.base_ram_addr(base_ram_addr), //BaseRAM地址
	.base_ram_be_n(base_ram_be_n),  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�?0
	.base_ram_ce_n(base_ram_ce_n),       //BaseRAM片�?�，低有�?
	.base_ram_oe_n(base_ram_oe_n),       //BaseRAM读使能，低有�?
	.base_ram_we_n(base_ram_we_n),       //BaseRAM写使能，低有�?

	//ExtRAM信号
	.ext_ram_data(ext_ram_data),  //ExtRAM数据
	.ext_ram_addr(ext_ram_addr), //ExtRAM地址
	.ext_ram_be_n(ext_ram_be_n),  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0
	.ext_ram_ce_n(ext_ram_ce_n),       //ExtRAM片�?�，低有�?
	.ext_ram_oe_n(ext_ram_oe_n),       //ExtRAM读使能，低有�?
	.ext_ram_we_n(ext_ram_we_n)       //ExtRAM写使能，低有�?
);


assign leds = 
            (sw == 0) ? debug_ins[15:0] :
            (sw == 1) ? debug_ins[31:16] :
            (sw == 4) ? debug_pc[15:0] :
            (sw == 5) ? debug_pc[31:16] :
            (sw == 6) ? debug_pc[47:32] :
            (sw == 7) ? debug_pc[63:48] :
            (sw == 8) ? mem_addr[15:0] :
            (sw == 9) ? mem_addr[31:16] :
            (sw == 10) ? mem_addr[47:32] :
            (sw == 11) ? mem_addr[63:48] :
            (sw == 12) ? mem_rdata[15:0] :
            (sw == 13) ? mem_rdata[31:16] :
            (sw == 14) ? mem_rdata[47:32] :
            (sw == 15) ? mem_rdata[63:48] :
            (sw == 16) ? mem_wdata[15:0] :
            (sw == 17) ? mem_wdata[31:16] :
            (sw == 18) ? mem_wdata[47:32] :
            (sw == 19) ? mem_wdata[63:48] :
            (sw == 20) ? base_ram_data[15:0] :
            (sw == 21) ? base_ram_data[31:16] :
            (sw == 22) ? ext_ram_data[15:0] :
            (sw == 23) ? ext_ram_data[31:16] :
            (sw == 24) ? serial_addr[15:0] : 
            (sw == 25) ? {serial_wdata[7:0], serial_rdata[7:0]} :
            (sw == 32) ? {mem_ready, 11'b0, mem_mode} :
            (sw == 40) ? {debug_if_mode, debug_mem_mode, debug_if_error, debug_mem_error, debug_if_wait,debug_mem_wait,debug_if_ready,debug_mem_ready} :
            (sw == 44) ? debug_if_addr[15:0] :
            (sw == 45) ? debug_if_addr[31:16] :
            (sw == 46) ? debug_mem_addr[15:0] :
            (sw == 47) ? debug_mem_addr[31:16] :
            (sw == 48) ? {serial_ready, 11'b0, serial_mode} : 
            (sw == 56) ? {12'b0, txd, ~txd, rxd, ~rxd} :
            (sw == 57) ? serial_debug_out :
            debug_ins[15:0];

endmodule
