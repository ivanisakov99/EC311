`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 11:19:06 AM
// Design Name: 
// Module Name: t_full_adder
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


module t_full_adder();
 reg c_in, a, b;
 wire c_out, sum;
 integer i;
 full_adder fullt(.c_out(c_out), .sum(sum), .a(a), .b(b), .c_in(c_in));
 
 initial begin
 #100 $finish;
 end
 
 initial begin
    for(i = 0; i < 8; i = i + 1) begin
        {a,b,c_in} = i;
        #10;
    end
 end
 
endmodule
