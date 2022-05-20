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
    input [5:0] a,
    input [5:0] b,
    input [3:0] mode,
    input reset,
    input inc,
    input clk,
    output[7:0] out
    );
wire [7:0] APrime, BPrime, DIE, TEMP, COMP, ANORB, AXORB, AXNORB, ANeg, BNeg, ADD, SUB, INC, DEC, MULT, BSUBA; 

assign ANeg = ~a + 1; //Twos complement negative number
assign BNeg = ~b + 1;

assign APrime = ~a; //Negate individual bits
assign BPrime = ~b;

assign ADD = a + b; //Basic algebra
assign SUB = a - b;
assign BSUBA = b - a;
assign INC = a + 1;
assign DEC = a - 1;
assign MULT = a*b;

assign ANORB[0] = !(a[0] | b[0]); // A NOR B
assign ANORB[1] = !(a[1] | b[1]);
assign ANORB[2] = !(a[2] | b[2]);
assign ANORB[3] = !(a[3] | b[3]);
assign ANORB[4] = !(a[4] | b[4]);
assign ANORB[5] = !(a[5] | b[5]);

assign AXORB[0] = a[0] ^ b[0]; // A XOR B
assign AXORB[1] = a[1] ^ b[1];
assign AXORB[2] = a[2] ^ b[2];
assign AXORB[3] = a[3] ^ b[3];
assign AXORB[4] = a[4] ^ b[4];
assign AXORB[5] = a[5] ^ b[5];

assign AXNORB[0] = a[0] ~^ b[0]; //A XNOR B
assign AXNORB[1] = a[1] ~^ b[1];
assign AXNORB[2] = a[2] ~^ b[2];
assign AXNORB[3] = a[3] ~^ b[3];
assign AXNORB[4] = a[4] ~^ b[4];
assign AXNORB[5] = a[5] ~^ b[5];


RandDie dieroller(.type(a), .reset(reset), .inc(inc), .clk(clk), .out(DIE)); //Call dice roller module

Temperature tempreader(.tempout(TEMP)); //Call temperature sensor module

Comparator comp(.a(a), .b(b), .out(COMP)); //Call comparator module
//Select proper output with multiplexor
mux16to1 outselect(.A(DIE), .B(TEMP), .C(COMP), .D(ANORB), .E(AXORB), .F(AXNORB), .G(APrime), .H(BPrime), .I(ANeg), .J(BNeg), .K(ADD), .L(SUB), .M(MULT), .N(BSUBA), .O(INC), .P(DEC), .sel(mode), .out(out));

endmodule
