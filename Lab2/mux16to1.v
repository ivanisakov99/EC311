`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 07:49:27 PM
// Design Name: 
// Module Name: Mux16to1
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


module mux16to1(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [3:0] E,
    input [3:0] F,
    input [3:0] G,
    input [3:0] H,
    input [3:0] I,
    input [3:0] J,
    input [3:0] K,
    input [3:0] L,
    input [3:0] M,
    input [3:0] N,
    input [3:0] O,
    input [3:0] P,
    input [3:0] sel,
    output reg [3:0] out
    );
    
always @ * begin 
 case (sel) 
  4'b0000 : out = A; 
  4'b0001 : out = B; 
  4'b0010 : out = C; 
  4'b0011 : out = D; 
  4'b0100 : out = E; 
  4'b0101 : out = F; 
  4'b0110 : out = G;  
  4'b0111 : out = H;  
  4'b1000 : out = I;  
  4'b1001 : out = J;  
  4'b1010 : out = K;  
  4'b1011 : out = L;  
  4'b1100 : out = M;   
  4'b1101 : out = N;   
  4'b1110 : out = O;   
  4'b1111 : out = P;   
 endcase 
end      
    
    
endmodule
