`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 08:25:37 PM
// Design Name: 
// Module Name: carrylookahead_adder
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


module carrylookahead_adder(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output[3:0] out,
    output c_out
    );
    wire [3:0]    w_G, w_P, w_C, w_SUM;
    
    full_adder add0(.a(a[0]), .b(b[0]), .c_in(c_in), .c_out(), .sum(w_SUM[0]));
    
    full_adder add1(.a(a[1]), .b(b[1]), .c_in(w_C[1]), .c_out(), .sum(w_SUM[1]));
     
    full_adder add2(.a(a[2]), .b(b[2]), .c_in(w_C[2]), .c_out(), .sum(w_SUM[2]));
      
    full_adder add3(.a(a[3]), .b(b[3]), .c_in(w_C[3]), .c_out(), .sum(w_SUM[3]));
    
    
    assign w_G[0] = a[0] & b[0];
    assign w_G[1] = a[1] & b[1];
    assign w_G[2] = a[2] & b[2];
    assign w_G[3] = a[3] & b[3];
 
    assign w_P[0] = a[0] | b[0];
    assign w_P[1] = a[1] | b[1];
    assign w_P[2] = a[2] | b[2];
    assign w_P[3] = a[3] | b[3];
 
    assign w_C[0] = c_in;
    assign w_C[1] = w_G[0] | (w_P[0] & w_C[0]);
    assign w_C[2] = w_G[1] | (w_P[1] & w_C[1]);
    assign w_C[3] = w_G[2] | (w_P[2] & w_C[2]);
    assign c_out = w_G[3] | (w_P[3] & w_C[3]);
    
    assign out = w_SUM;
    
endmodule
