`timescale 1ns / 1ps

module flowled(
    input               sys_clk  ,
    input               sys_rst_n,
    output  reg  [7:0]  led
    );

//reg define
reg [31:0] counter1, counter2;//��¼��˸����
reg [31:0] cnt;               //��¼����ģʽ����һ�ֵ�����
reg led_control;    //��˸ģʽ
reg [7:0] led1,led2;//�洢�Ƶ�����״̬
                                                                                                                                                                                                                         
//ģʽ0����˸1��2s
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter1 <= 32'd0;
    else if(!led_control)
            if (counter1 < (32'd200_000_000-1'd1))//200000000��ʱ������,2s
                                                  //��1��ԭ�򣺣�1��counter1 <= 0����ѭ���л��һ�����ڣ�������������Ӧ�÷ŵ���counter1 ��0��Ϊ1���������ܱ�֤ʱ��Ϊ1s��
                counter1 <= counter1 + 1'b1;
            else
                counter1 <= 32'd0;
    else
        counter1 <= 32'd0; 
end

//ģʽ1����˸1��1.5s
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        counter2<=32'd0;
    else if(led_control)
            if (counter2 < (32'd150_000_000-1'd1))//1.5s
                counter2 <= counter2 + 1'b1;
            else
                counter2 <= 32'd0;
    else
        counter2 <= 32'd0;
end 

//����ģʽ����һ����Ҫ22s
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt<=32'd0;
    else if(cnt<32'd2200_000_000)//22s
        cnt<=cnt+1;
    else
        cnt<=0;
end 

//ǰ16sģʽ0����6sģʽ1
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led_control <= 0;
    else
        case(cnt)
            32'd1600_000_000: led_control <= 1;
            32'd2200_000_000: led_control <= 0;
            default: led_control <= led_control;
        endcase;
end

//ģʽ0���洢�Ƶ�״̬
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led1<=8'b00000001;
    else if (!led_control) begin
            if (counter1 == (32'd200_000_000-1'd1)) 
                led1 <= {led1[6:0],led1[7]};
            else 
                led1 <= led1;
            end
    else led1 <= {led2[6:0],led2[7]};
end

//ģʽ1���洢�Ƶ�״̬
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led2<=8'b00000000;
    else if (led_control) begin
            if (counter2 == (32'd150_000_000-1'd1)) 
                led2 <= {led2[1:0],led2[7:2]}; 
            else 
                led2 <= led2;
        end
        else led2 <= {led1[1:0],led1[7:2]};
end
        
//����ĵƵ�״̬
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led <= 8'b00000001;
    else 
        case (led_control)
            0:if(counter1 < 32'd100_000_000) //1s��ص�
                led <= led1;
              else if (counter1 == 32'd100_000_000) 
                led <= 0;
            1:if(counter2 < 32'd100_000_000) 
                led <= led2;
              else if (counter2 == 32'd100_000_000) 
                led <= 0;
            default:led <= led;
        endcase
end

endmodule
