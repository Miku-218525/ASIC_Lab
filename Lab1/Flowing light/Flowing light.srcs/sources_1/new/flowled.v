`timescale 1ns / 1ps

module flowled(
    input               sys_clk  ,
    input               sys_rst_n,
    output  reg  [7:0]  led
    );

//reg define
reg [31:0] counter1, counter2;
reg [31:0] cnt;
reg led_control;
reg [7:0] led1,led2;
//*****************************************************
//**                    main code
//***************************************************** 
                                                                                                                                                                                                                         
//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter1 <= 32'd0;
    else if(!led_control)
            if (counter1 < 32'd200_000_000)
                counter1 <= counter1 + 1'b1;
            else
                counter1 <= 32'd0;
        else
            counter1 <= 32'd0; 
end

//
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        counter2<=32'd0;
    else if(led_control)
            if (counter2 < 32'd150_000_000)
                counter2 <= counter2 + 1'b1;
            else
                counter2 <= 32'd0;
        else
            counter2 <= 32'd0;
end 

//
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt<=32'd0;
    else if(cnt<32'd2200_000_000)
        cnt<=cnt+1;
    else
        cnt<=0;
end 

//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led_control <= 0;
    else case(cnt)
        32'd1600_000_000: led_control <= 1;
        32'd2200_000_000: led_control <= 0;
        default: led_control <= led_control;
        endcase;
end

//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led1<=8'b00000001;
    else if (!led_control) begin
            if (counter1 == 32'd200_000_000) 
                led1 <= {led1[6:0],led1[7]};
            else 
                led1 <= led1;
        end
        else led1 <= {led2[6:0],led2[7]};
end

//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led2<=8'b00000000;
    else if (led_control) begin
            if (counter2 == 32'd150_000_000) 
                led2 <= {led2[1:0],led2[7:2]}; 
            else 
                led2 <= led2;
        end
        else led2 <= {led1[1:0],led1[7:2]};
end
        
//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led <= 8'b00000001;
    else case (led_control)
            0   : if(counter1 < 32'd100_000_000) 
                led <= led1; 
            else if (counter1 == 32'd100_000_000) 
                led <= 0;
            1   : if(counter2 < 32'd100_000_000) 
                led <= led2; 
            else if (counter2 == 32'd100_000_000) 
                led <= 0;
            default  : led <= led;
        endcase
end

endmodule
