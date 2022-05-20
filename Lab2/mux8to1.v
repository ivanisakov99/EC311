`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:38:52 PM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,
    input [3:0] sel,
    output reg out
    );
    
always @ * begin 
 case (sel) 
  4'b1000 : out = A; 
  4'b1001 : out = B; 
  4'b1010 : out = C; 
  4'b1011 : out = D; 
  4'b1110 : out = E; 
  4'b1100 : out = F; 
  4'b1111 : out = G;
  4'b1101 : out = H;
  default : out = 0; 
 endcase 
end  

endmodule
