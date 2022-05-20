`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 04:32:23 PM
// Design Name: 
// Module Name: RandDie
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


module RandDie(
    input [5:0] type,
    input reset,
    input inc,
    input clk,
    output[7:0] out
    );
    reg [7:0] A2, B2, A4, A6, A10, aclk;
    wire incstate;
    
   // debounce db(.clk(clk), .pb_1(inc), .pb_out(incstate));
    
    always @ (posedge clk) begin
        if(reset == 1'b1 || A2 > 252 || A4 > 250 || A6 > 248 || A10 > 244) begin
            A2 = 0;
            A4 = 0;
            A6 = 0;
            A10 = 0;
            #10;
        end
        else if (inc == 1) begin
            case(type[1:0])
            2'b00:begin //D2
                //number in storage is number in storage plus new roll
                A2 = A2 + {$random(clk)}%2 + 1;   
                
            end
            2'b01:begin //D4
                
                A4 = A4 + {$random(clk)}%4 + 1;
                
            end
            2'b10:begin //D6
                
                A6 = A6 + {$random(clk)}%6 + 1;
                
            end
            2'b11:begin //D10
                
                A10 = A10 + {$random(clk)}%10 + 1; 
                
            end
    endcase
    end
    end
    
    assign out = type[1] == 1'b1 ? (type[0] == 1'b1 ? A10 : A6) : (type[0] == 1'b1 ? A4 : A2); //simple 4 to 1 MUX
     
endmodule
