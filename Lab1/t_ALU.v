`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 04:26:55 PM
// Design Name: 
// Module Name: t_ALU
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


module t_ALU();
reg m0, m1, c_in, a0, a1, a2, b0, b1, b2;
wire c_out; 
wire [2:0] out;
integer i;

ALU_2 t_ALU(.m1(m1), .m0(m0), .c_out(c_out), .out(out), .c_in(c_in), .a0(a0), .a1(a1), .a2(a2), .b0(b0), .b1(b1), .b2(b2));

initial begin
 #20000 $finish;
 end
 
 initial begin
    for(i = 0; i < 512; i = i + 1) begin
        {m1,m0,c_in,a2,a1,a0,b2,b1,b0} = i;
        #1;
    end
 end

endmodule
