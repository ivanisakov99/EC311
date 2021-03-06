`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:04:11 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
input [1:0] refreshcounter,
output reg [3:0] anode = 0
    );
    
always@(refreshcounter)
begin
    case(refreshcounter)
   2'b00: anode = 4'b1110;//digit 1
   2'b01: anode = 4'b1101;//digit 2
   2'b10: anode = 4'b1011;//digit 3
   2'b11: anode = 4'b0111;//digit 4
    endcase
end
endmodule
