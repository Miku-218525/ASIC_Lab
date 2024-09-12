`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/13 00:53:23
// Design Name: 
// Module Name: timer
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


module timer(
    input  [3:0] key,       // 对应启动、暂停、停止和清空功能，与拨码开关引脚绑定
    input  clk_s,           // 板上pl域的100MHz时钟
    output [7:0] ledg,      // 对应8个led灯
    output [7:0] bit_o,     // 对应八个数码管的位选
    output [7:0] segh_o,    // 对应高四位数码管的段选
    output [7:0] segl_o     // 对应低四位数码管的段选
    );
    
    
endmodule

