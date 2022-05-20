`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 08:56:04 PM
// Design Name: 
// Module Name: LED
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


module LED(
    input wire clk,
    input alarmen,
    output wire led
    );
    wire ledout;
    
    clock_divider_led wrapper ( .clk(clk), .divided_clk(ledout));
    
    assign led = alarmen ? ledout : 1'b0;
    
endmodule
