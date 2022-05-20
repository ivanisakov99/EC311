`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 08:50:37 PM
// Design Name: 
// Module Name: t_carrylookahead_adder
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


module t_carrylookahead_adder();
reg [3:0] a, b;
reg c_in;
wire [3:0] out;
wire c_out;
integer i;

carrylookahead_adder testcarry(.a(a), .b(b), .c_in(c_in), .c_out(c_out), .out(out));

initial begin
#30000 $finish;
end

initial begin
for (i = 0; i < 512; i = i + 1) begin
{c_in, a, b} = i;
#1;
end
end

endmodule
