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
    input  [3:0] key,       // ��Ӧ��������ͣ��ֹͣ����չ��ܣ��벦�뿪�����Ű�
    input  clk_s,           // ����pl���100MHzʱ��
    output [7:0] ledg,      // ��Ӧ8��led��
    output [7:0] bit_o,     // ��Ӧ�˸�����ܵ�λѡ
    output [7:0] segh_o,    // ��Ӧ����λ����ܵĶ�ѡ
    output [7:0] segl_o     // ��Ӧ����λ����ܵĶ�ѡ
    );
    
    
endmodule

