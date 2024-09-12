`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/13 01:12:46
// Design Name: 
// Module Name: test_bench
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


module test_bench(
    );
    //定义参数
    wire [3:0] key;
    reg  clk = 0;
    wire [7:0] led;
    wire [7:0] wx;
    wire [3:0] dx_h;
    wire [3:0] dx_l;
    
    initial begin
        
    end
     
    always #5 clk = ~clk;//100MHz时钟
    
    timer timer1(
        .key      (key),    // 对应启动、暂停、停止和清空功能，与拨码开关引脚绑定
        .clk_s    (clk),    // 板上pl域的100MHz时钟
        .ledg     (led),    // 对应8个led灯
        .bit_o    (wx),     // 对应八个数码管的位选
        .segh_o   (dx_h),   // 对应高四位数码管的段选
        .segl_o   (dx_l)    // 对应低四位数码管的段选
        );
endmodule
