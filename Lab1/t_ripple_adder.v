`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 11:57:11 AM
// Design Name: 
// Module Name: t_ripple_adder
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


module t_ripple_adder();
reg c_in, a0, a1, a2, b0, b1, b2;
wire c_out, out0, out1, out2;
integer i;

ripple_adder tripple(.c_out(c_out), .out0(out0), .out1(out1), .out2(out2), .c_in(c_in), .a0(a0), .a1(a1), .a2(a2), .b0(b0), .b1(b1), .b2(b2));

initial begin
#1000 $finish;
end

initial begin
    for (i = 0; i < 128; i = i + 1) begin
        {c_in, a0, a1, a2, b0, b1, b2} = i;
        #5;
    end
end
endmodule
