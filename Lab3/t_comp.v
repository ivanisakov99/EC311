`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 07:30:09 PM
// Design Name: 
// Module Name: t_comp
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


module t_comp();
    reg [5:0] a, b;
    wire [1:0] out;
    integer i;
    
    Comparator comptest(.a(a), .b(b), .out(out));
    
initial begin
    #30000 $finish;
end

initial begin
    a = 8'b01101001;
    for (i = 0; i < 256; i = i + 1) begin
        b = i;
        #2;
    end
end
    
endmodule
