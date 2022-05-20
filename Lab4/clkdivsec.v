`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 02:53:22 AM
// Design Name: 
// Module Name: clkdivsec
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


module clkdivsec(
    input clk,
    output reg out_clk = 0
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
    out_clk <= ~out_clk;
    else
    out_clk <= out_clk;
end
endmodule
    
//    reg[30:0] counter=31'd0;
//    parameter DENOM = 31'd50_000_000;

//    always @(posedge clk) begin
//        counter <= counter + 31'd1;
//        if(counter>=(DENOM-1)) begin
//            counter <= 31'd0;
//        end
//    end
//    assign out_clk = (counter < DENOM/2)? 1'b0 : 1'b1;
    
//endmodule
