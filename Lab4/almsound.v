`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 01:27:30 PM
// Design Name: 
// Module Name: almsound
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


module almsound(
    input clk,
    input enable,
    output reg alarm
    );
    
    initial
    begin
    alarm = 0;
    end
    reg out_clk = 0;
    localparam div_value = 4; //25 / 2 * freq

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
    
    
//    wire out_clk;
//    reg[1:0] ccounter=2'd0;
//    parameter DENOM = 2'd2;

//    always @(posedge clk) begin
//        ccounter <= ccounter + 2'd1;
//        if(ccounter>=(DENOM-1)) begin
//            ccounter <= 2'd0;
//        end
//    end
    
//    assign out_clk = (ccounter<DENOM/2)? 1'b0 : 1'b1;
    
    reg [14:0] counter;
    always @(posedge out_clk) begin
    if(enable == 1) begin
        if(counter==28408) begin 
            counter<=0; 
            end
        else begin 
            counter <= counter+1;
        end
    end
    end
    always @(posedge clk) begin 
    
        if(counter==28400 && enable == 1) begin
            alarm <= ~alarm;
        end
    end
    
endmodule

