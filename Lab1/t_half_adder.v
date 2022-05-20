`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 10:46:15 AM
// Design Name: 
// Module Name: t_half_adder
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


module t_half_adder();
 reg a,b;
 wire sum, c_out;

 half_adder half(.sum(sum), .c_out(c_out), .a(a), .b(b));
 
 initial begin
 #100 $finish;
 end
 
 initial begin
 #10 a = 0; b = 0;
 #10 a = 1;
 #10 b = 1;
 #10 a = 0;
 end

endmodule
