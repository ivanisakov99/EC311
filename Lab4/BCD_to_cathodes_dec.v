`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:38:15 PM
// Design Name: 
// Module Name: BCD_to_cathodes_dec
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


module BCD_to_cathodes_dec(
input mode,
input [3:0] digit,
output  o_Segment_A,
output  o_Segment_B,
output  o_Segment_C,
output  o_Segment_D,
output  o_Segment_E,
output  o_Segment_F,
output  o_Segment_G
    );

reg [6:0]    r_Dec_Encoding = 7'b0000000;

always@ (digit)
begin
    case(digit)
        4'b0000 : r_Dec_Encoding <= 7'b0000001;//0
        4'b0001 : r_Dec_Encoding <= 7'b1001111;//1
        4'b0010 : r_Dec_Encoding <= 7'b0010010;//2
        4'b0011 : r_Dec_Encoding <= 7'b0000110;//3
        4'b0100 : r_Dec_Encoding <= 7'b1001100;   //4       
        4'b0101 : r_Dec_Encoding <= 7'b0100100;//5
        4'b0110 : r_Dec_Encoding <= 7'b0100000;//6
        4'b0111 : r_Dec_Encoding <= 7'b0001111;//7
        4'b1000 : r_Dec_Encoding <= 7'b0000000;//8
        4'b1001 : r_Dec_Encoding <= 7'b0000100;//9
//        4'b1010 : r_Dec_Encoding <= 7'b;
//        4'b1011 : r_Dec_Encoding <= 7'b;
//        4'b1100 : r_Dec_Encoding <= 7'b;
//        4'b1101 : r_Dec_Encoding <= 7'b;
//        4'b1110 : r_Dec_Encoding <= 7'b;
//        4'b1111 : r_Dec_Encoding <= 7'b;
    endcase
end
  assign o_Segment_A = ~r_Dec_Encoding[6];
  assign o_Segment_B = ~r_Dec_Encoding[5];
  assign o_Segment_C = ~r_Dec_Encoding[4];
  assign o_Segment_D = ~r_Dec_Encoding[3];
  assign o_Segment_E = ~r_Dec_Encoding[2];
  assign o_Segment_F = ~r_Dec_Encoding[1];
  assign o_Segment_G = ~r_Dec_Encoding[0];
  
endmodule