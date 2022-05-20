`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 07:30:09 PM
// Design Name: 
// Module Name: t_temp
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


module t_temp();
    wire [7:0] tempoutput;
    integer i;
    
    Temperature temptest(.tempout(tempoutput));
    
initial begin
    #1000 $finish;
end

initial begin
    for (i = 0; i < 32; i = i + 1) begin
        #50;
    end
end

endmodule
