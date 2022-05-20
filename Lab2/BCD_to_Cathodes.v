`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:17:06 PM
// Design Name: 
// Module Name: BCD_to_Cathodes
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


module BCD_to_Cathodes(
input mode,
input [3:0] digit,
output  reg  o_Segment_A,
output reg o_Segment_B,
output reg o_Segment_C,
output reg o_Segment_D,
output reg o_Segment_E,
output reg o_Segment_F,
output reg o_Segment_G
    );

reg [6:0]    r_Encoding = 7'b0000000;

always@ (digit)
begin
if(mode == 0)begin
    case(digit)
        4'b0000 : r_Encoding <= 7'b1111110;//0
        4'b0001 : r_Encoding <= 7'b0110000;//1
        4'b0010 : r_Encoding <= 7'b1101101;//2
        4'b0011 : r_Encoding <= 7'b1111001;//3
        4'b0100 : r_Encoding <= 7'b0110011;//4       
        4'b0101 : r_Encoding <= 7'b1011011;//5
        4'b0110 : r_Encoding <= 7'b1011111;//6
        4'b0111 : r_Encoding <= 7'b1110000;//7
        4'b1000 : r_Encoding <= 7'b1111111;//8
        4'b1001 : r_Encoding <= 7'b1111011;//9
        4'b1010 : r_Encoding <= 7'b1110111;//A
        4'b1011 : r_Encoding <= 7'b0011111;//B
        4'b1100 : r_Encoding <= 7'b1001110;//C
        4'b1101 : r_Encoding <= 7'b0111101;//D
        4'b1110 : r_Encoding <= 7'b1001111;//E
        4'b1111 : r_Encoding <= 7'b1000111;//F
    endcase

   o_Segment_A = ~r_Encoding[6];
   o_Segment_B = ~r_Encoding[5];
   o_Segment_C = ~r_Encoding[4];
   o_Segment_D = ~r_Encoding[3];
   o_Segment_E = ~r_Encoding[2];
   o_Segment_F = ~r_Encoding[1];
   o_Segment_G = ~r_Encoding[0];
end
else

    case(digit)
        4'b0000 : r_Encoding <= 7'b1111110;//0
        4'b0001 : r_Encoding <= 7'b0110000;//1
        4'b0010 : r_Encoding <= 7'b1101101;//2
        4'b0011 : r_Encoding <= 7'b1111001;//3
        4'b0100 : r_Encoding <= 7'b0110011;//4       
        4'b0101 : r_Encoding <= 7'b1011011;//5
        4'b0110 : r_Encoding <= 7'b1011111;//6
        4'b0111 : r_Encoding <= 7'b1110000;//7
        4'b1000 : r_Encoding <= 7'b1111111;//8
        4'b1001 : r_Encoding <= 7'b1111011;//9
        4'b1111 : r_Encoding <= 7'b0000001; //minus
//        4'b1010 : r_Dec_Encoding <= 7'b;
//        4'b1011 : r_Dec_Encoding <= 7'b;
//        4'b1100 : r_Dec_Encoding <= 7'b;
//        4'b1101 : r_Dec_Encoding <= 7'b;
//        4'b1110 : r_Dec_Encoding <= 7'b;
//        4'b1111 : r_Dec_Encoding <= 7'b;
    endcase
   o_Segment_A = ~r_Encoding[6];
   o_Segment_B = ~r_Encoding[5];
   o_Segment_C = ~r_Encoding[4];
   o_Segment_D = ~r_Encoding[3];
   o_Segment_E = ~r_Encoding[2];
   o_Segment_F = ~r_Encoding[1];
   o_Segment_G = ~r_Encoding[0];
end
endmodule
