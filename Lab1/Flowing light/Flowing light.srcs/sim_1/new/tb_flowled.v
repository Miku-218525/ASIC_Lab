`timescale 1ns / 1ps

module tb_flowled();
reg clk=0, rst=0;
wire [7:0] led;
flowled flowled(
    .sys_clk        (clk), 
    .sys_rst_n      (rst),
    .led            (led)
    );
initial # 20 rst=1;   //20ns后复位
always # 5 clk = ~clk;//时钟周期：10ns
endmodule
