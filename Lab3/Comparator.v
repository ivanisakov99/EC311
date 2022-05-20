`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:11:19 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input [5:0] a,
    input [5:0] b,
    output reg [1:0] out
    );
  always @ * begin
            case(a[5] ^ b[5]) //Recursively looking to see if one bit is high and the other low
            1'b1 : out = a[5] == 1'b1 ? 2'b10 : 2'b01; //In the case of a high xor, the high bit is the larger number
    
            1'b0 :  begin //Else, repeat the cycle down one bit
    
                case(a[4] ^ b[4])
                1'b1 : out = a[4] == 1'b1 ? 2'b10 : 2'b01; 
    
                1'b0 : begin
                    case(a[3] ^ b[3])
                    1'b1 : out = a[3] == 1'b1 ? 2'b10 : 2'b01; 
    
                    1'b0 : begin
                    
                        case(a[2] ^ b[2])
                        1'b1 : out = a[2] == 1'b1 ? 2'b10 : 2'b01; 
    
                        1'b0 : begin
    
                            case(a[1] ^ b[1])
                            1'b1 : out = a[1] == 1'b1 ? 2'b10 : 2'b01; 
    
                            1'b0 : begin
                            
                                case(a[0] ^ b[0])
                                1'b1 : out = a[0] == 1'b1 ? 2'b10 : 2'b01;
    
                                1'b0 : out = 2'b00; //All bits are the same, therefor A = B
                                endcase
                            end
                            endcase
                        end
                        endcase
                    end
                    endcase
                end
                endcase
            end
            endcase
end
endmodule
