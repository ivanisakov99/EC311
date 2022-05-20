`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 11:47:08 AM
// Design Name: 
// Module Name: ripple_adder
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


module ripple_adder(
    input a0, input a1, input a2, 
    input b0, input b1, input b2, 
    input c_in, 
    output c_out, 
    output out0, output out1, output out2
    );
    
    wire wc0, wc1;
    
    full_adder full0(.c_out(wc0), .sum(out0), .c_in(c_in), .a(a0), .b(b0));
    full_adder full1(.c_out(wc1), .sum(out1), .c_in(wc0), .a(a1), .b(b1));
    full_adder full2(.c_out(c_out), .sum(out2), .c_in(wc1), .a(a2), .b(b2));
    
endmodule
