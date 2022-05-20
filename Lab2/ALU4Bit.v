`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 07:36:40 PM
// Design Name: 
// Module Name: ALU4Bit
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


module ALU4Bit(
    input [3:0] a,
    input [3:0] b,
    input [3:0] mode,
    input c_in,
    output[3:0] out,
    output c_out
    );

wire [4:0] ANeg, BNeg, ADD, SUB, INC, DEC, MULT, BSUBA;
wire [3:0] APrime, BPrime, AANDB, AORB, ANANDB, ANORB, AXORB, AXNORB, decB;

assign decB = 1;

assign ANeg = ~a + 1;
assign BNeg = ~b + 1;

assign APrime = ~a;
assign BPrime = ~b;

carrylookahead_adder add(.a(a), .b(b), .c_in(c_in), .c_out(ADD[4]), .out(ADD[3:0]));
carrylookahead_adder sub(.a(a), .b(~b), .c_in(1'b1), .c_out(SUB[4]), .out(SUB[3:0]));

assign INC = a + 1;

carrylookahead_adder dec(.a(a), .b(~decB), .c_in(1'b1), .c_out(DEC[4]), .out(DEC[3:0]));


assign MULT = a*b;

carrylookahead_adder bsuba(.a(~a), .b(b), .c_in(1'b1), .c_out(BSUBA[4]), .out(BSUBA[3:0]));

assign AANDB[0] = a[0] & b[0];
assign AANDB[1] = a[1] & b[1];
assign AANDB[2] = a[2] & b[2];
assign AANDB[3] = a[3] & b[3];
assign AORB[0] = a[0] | b[0];
assign ANANDB[0] = !(a[0] & b[0]);
assign ANANDB[1] = !(a[1] & b[1]);
assign ANANDB[2] = !(a[2] & b[2]);
assign ANANDB[3] = !(a[3] & b[3]);
assign AORB[0] = a[0] | b[0];
assign AORB[1] = a[1] | b[1];
assign AORB[2] = a[2] | b[2];
assign AORB[3] = a[3] | b[3];
assign ANORB[0] = !(a[0] | b[0]);
assign ANORB[1] = !(a[1] | b[1]);
assign ANORB[2] = !(a[2] | b[2]);
assign ANORB[3] = !(a[3] | b[3]);
assign AXORB[0] = a[0] ^ b[0];
assign AXORB[1] = a[1] ^ b[1];
assign AXORB[2] = a[2] ^ b[2];
assign AXORB[3] = a[3] ^ b[3];
assign AXNORB[0] = a[0] ~^ b[0];
assign AXNORB[1] = a[1] ~^ b[1];
assign AXNORB[2] = a[2] ~^ b[2];
assign AXNORB[3] = a[3] ~^ b[3];

mux16to1 outsel(.A(AANDB), .B(AORB), .C(ANANDB), .D(ANORB), .E(AXORB), .F(AXNORB), .G(APrime), .H(BPrime), .I(ANeg[3:0]), .J(BNeg[3:0]), .K(ADD[3:0]), .L(SUB[3:0]), .M(MULT[3:0]), .N(BSUBA[3:0]), .O(INC[3:0]), .P(DEC[3:0]), .sel(mode), .out(out));
mux8to1 c_outsel(.A(~ANeg[4]), .B(~BNeg[4]), .C(ADD[4]), .D(~SUB[4]), .E(INC[4]), .F(MULT[4]), .G(~DEC[4]), .H(~BSUBA[4]), .sel(mode), .out(c_out));

endmodule
