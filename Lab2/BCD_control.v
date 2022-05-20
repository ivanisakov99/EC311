`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:09:09 PM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
input mode,
input [3:0] digit1,
input [3:0] digit2,
input [3:0] digit3,
//input [3:0] digit4,
//input [3:0] digit5,
//input [3:0] digit6,
//input [3:0] digit7,
//input [3:0] digit8,
input [1:0] refreshcounter,
output reg [3:0] ONE_DIGIT = 0
    );
    
always@(refreshcounter)
begin
    case(refreshcounter)
    2'd0: ONE_DIGIT = digit1;
    2'd1: ONE_DIGIT = digit2;
    2'd2: ONE_DIGIT = digit3;
    2'd3: 
    begin
    if(mode == 0)
    ONE_DIGIT = 4'b0000;
    else
    ONE_DIGIT = 4'b1111;
    end
//    3'b011: ONE_DIGIT = digit4;
//    3'b100: ONE_DIGIT = digit5;
//    3'b101: ONE_DIGIT = digit6;
//    3'b110: ONE_DIGIT = digit7;
//    3'b111: ONE_DIGIT = digit8;
    endcase
end
endmodule
