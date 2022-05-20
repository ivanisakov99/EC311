`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 05:12:37 PM
// Design Name: 
// Module Name: t_RandDie
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


module t_RandDie();
    reg [5:0] type;
    reg reset;
    reg inc;
    reg clk;
    wire [7:0] out;
    integer i;
    
    RandDie randtest(.type(type), .inc(inc), .clk(clk), .reset(reset), .out(out));
    
initial begin
    #10000 $finish;
end

initial begin
    clk = 0;
    reset = 0;
    inc = 0;
    for (i = 0; i < 4; i = i + 1) begin
        {type} = i;
        #5;
        reset = 1;
        #5
        reset = 0;
        #5
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #0.05;
        inc = 0;
        #0.05;
        inc = 1;
        #5;
        inc = 0;
        #5;
        reset = 1;
        #5;
        reset = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
        inc = 1;
        #5;
        inc = 0;
        #5;
    end
end
    always begin
        clk = !clk;
        #1;
    end
    
endmodule
