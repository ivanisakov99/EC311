`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 11:17:55 PM
// Design Name: 
// Module Name: tb_Full_system
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


module tb_Full_system;

reg switch, mode, clk, c_in;

wire anode, o_Segment_A, o_Segment_B, o_Segment_C, o_Segment_D, o_Segment_E, o_Segment_F, o_Segment_G, c_out;

Full_system uut(.switch(switch), .mode(mode), .clk(clk), .c_in(c_in), .anode(anode), .o_Segment_A(o_Segment_A), .o_Segment_B(o_Segment_B), .o_Segment_C(o_Segment_C), .o_Segment_D(o_Segment_D), .o_Segment_E(o_Segment_E), .o_Segment_F(o_Segment_F), .o_Segment_G(o_Segment_G), .c_out(c_out));  

integer i;

initial
begin
#20000 $finish;
end
initial 
begin
assign mode = 0;
for(i = 0; i < 2048; i = i+1)
begin
switch = i;
#1;
end

assign mode = 1;
for(i = 0; i < 2048; i = i+1)
begin
switch = i;
#1;
end
end

endmodule
