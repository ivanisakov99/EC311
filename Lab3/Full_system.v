`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 09:53:28 PM
// Design Name: 
// Module Name: Full_system
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


module Full_system(
input [15:0]switch,
input inc,
input reset,
//input mode,
input clk,
//input c_in,

output [7:0]anode,
output wire o_Segment_A,
output wire o_Segment_B,
output wire o_Segment_C,
output wire o_Segment_D,
output wire o_Segment_E,
output wire o_Segment_F,
output wire o_Segment_G
//output wire c_out
    );
    
wire [7:0]ans;
    
ALU4Bit ALU4Bit_alu( .a(switch[5:0]), .b(switch[11:6]), .mode(switch[15:12]), .reset(reset), .inc(inc), .out(ans));

top top_module(.clk(clk), .ans(ans), .switch(switch), .anode(anode), .o_Segment_A(o_Segment_A), .o_Segment_B(o_Segment_B), .o_Segment_C(o_Segment_C), .o_Segment_D(o_Segment_D), .o_Segment_E(o_Segment_E), .o_Segment_F(o_Segment_F), .o_Segment_G(o_Segment_G));  

endmodule
