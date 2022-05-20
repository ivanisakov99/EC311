`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 07:42:25 PM
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(
    input [3:0] a, 
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [1:0] mode,
    output [3:0] out);

    assign out = mode[1] ? (mode[0] ? d : c) : (mode[0] ? b : a);

endmodule
