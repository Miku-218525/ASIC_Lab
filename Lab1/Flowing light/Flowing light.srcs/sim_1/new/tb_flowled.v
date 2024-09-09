`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/18 18:33:44
// Design Name: 
// Module Name: tb_ledflow
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

module tb_flowled();
reg clk=0, rst=0;
wire [7:0] led;
flowled flowled(
    .sys_clk        (clk), 
    .sys_rst_n      (rst),
    .led            (led)
    );
initial # 20 rst=1;//20��ʱ�䵥λ��λ
always # 10 clk = ~clk;//ÿ10��ʱ�䵥λȡ��ʱ��
endmodule
