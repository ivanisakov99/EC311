`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 05:19:56 PM
// Design Name: 
// Module Name: ALU_2
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


module ALU_2(input m0, input m1,
    input a0, input a1, input a2, 
    input b0, input b1, input b2, 
    input c_in, 
    output c_out, 
    output [2:0] out
    );
wire [3:0] a,b,c,d;
integer subcarry = 1;

ripple_adder ripadd(.a0(a0), .a1(a1), .a2(a2), .b0(b0), .b1(b1), .b2(b2), .c_in(c_in), .c_out(a[3]), .out0(a[0]), .out1(a[1]), .out2(a[2]));
ripple_adder ripsub(.a0(a0), .a1(a1), .a2(a2), .b0(!b0), .b1(!b1), .b2(!b2), .c_in(subcarry), .c_out(b[3]), .out0(b[0]), .out1(b[1]), .out2(b[2]));

xor(c[0], a0, b0);
xor(c[1], a1, b1);
xor(c[2], a2, b2);
and(c[3], 0, 0);
and(d[0], a0, b0);
and(d[1], a1, b1);
and(d[2], a2, b2);
and(d[3], 0, 0);

mux_4to1 muxbang(.a(a), .b(b), .c(c), .d(d), .mode({m1, m0}), .out({c_out, out}));

endmodule
