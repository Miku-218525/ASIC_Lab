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
    //�������
    wire [3:0] key;
    reg  clk = 0;
    wire [7:0] led;
    wire [7:0] wx;
    wire [3:0] dx_h;
    wire [3:0] dx_l;
    
    initial begin
        
    end
     
    always #5 clk = ~clk;//100MHzʱ��
    
    timer timer1(
        .key      (key),    // ��Ӧ��������ͣ��ֹͣ����չ��ܣ��벦�뿪�����Ű�
        .clk_s    (clk),    // ����pl���100MHzʱ��
        .ledg     (led),    // ��Ӧ8��led��
        .bit_o    (wx),     // ��Ӧ�˸�����ܵ�λѡ
        .segh_o   (dx_h),   // ��Ӧ����λ����ܵĶ�ѡ
        .segl_o   (dx_l)    // ��Ӧ����λ����ܵĶ�ѡ
        );
endmodule
