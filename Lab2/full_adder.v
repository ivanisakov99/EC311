`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 11:11:33 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(input c_in, input a, input b, output c_out, output sum);
    wire w1;
    wire w2;
    wire w3;
    
    half_adder half1(.c_out(w2), .sum(w1), .a(a), .b(b));
    half_adder half2(.c_out(w3), .sum(sum), .a(c_in), .b(w1));
    or(c_out, w2, w3);
endmodule
