`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:28:26 PM
// Design Name: 
// Module Name: top
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


module top(
input clk,
input wire [11:0] switch,
input wire mode,
//input wire [3:0] button,
output [3:0]anode,

output wire o_Segment_A,
output wire o_Segment_B,
output wire o_Segment_C,
output wire o_Segment_D,
output wire o_Segment_E,
output wire o_Segment_F,
output wire o_Segment_G
    );
//reg [3:0]anode0 = 4'b1111;
wire refresh_clock;
wire [1:0] refreshcounter;
wire [3:0] ONE_DIGIT;

clock_divider refreshclock_generator(.clk(clk), .divided_clk(refresh_clock));

refreshcounter Refreshcounter_wrapper(.refresh_clock(refresh_clock), .refreshcounter(refreshcounter));

anode_control anode_control_wrapper(.refreshcounter(refreshcounter), .anode(anode));

BCD_control BCD_control_wrapper(.mode(mode), .digit1(switch[3:0]), .digit2(switch[7:4]), .digit3(switch[11:8]), .refreshcounter(refreshcounter), .ONE_DIGIT(ONE_DIGIT));

BCD_to_Cathodes BCD_to_Cathodes_wrapper(.mode(mode), .digit(ONE_DIGIT), .o_Segment_A(o_Segment_A),.o_Segment_B(o_Segment_B),.o_Segment_C(o_Segment_C),.o_Segment_D(o_Segment_D),.o_Segment_E(o_Segment_E),.o_Segment_F(o_Segment_F),.o_Segment_G(o_Segment_G));


endmodule
