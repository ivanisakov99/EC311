`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:35:23 PM
// Design Name: 
// Module Name: t_ALU4Bit
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


module t_ALU4Bit();
reg [3:0] a, b, mode;
reg c_in;
wire c_out;
wire [3:0] out;
integer i;

ALU4Bit test(.a(a), .b(b), .mode(mode), .c_in(c_in), .c_out(c_out), .out(out));

initial begin
#30000 $finish;
end

initial begin
assign a = 4'b1111;
for (i = 0; i < 512; i = i + 1) begin
{mode, c_in, b} = i;
#1;
end
end
endmodule
