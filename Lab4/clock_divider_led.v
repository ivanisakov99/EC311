`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 08:57:06 PM
// Design Name: 
// Module Name: clock_divider_led
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


module clock_divider_led(
    input clk,
    //input alarmin,
    
    output reg divided_clk = 0
    );
    
   
    
localparam div_value = 49999999; 

integer counter_value = 0;

always@ (posedge clk)
begin
    if(counter_value == div_value)
    counter_value <= 0;
    else
    counter_value <= counter_value + 1;
end

always@ (posedge clk)
begin
    if(counter_value == div_value)
    divided_clk <= ~divided_clk;
    else
    divided_clk <= divided_clk;
end



endmodule
