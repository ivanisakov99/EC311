`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 07:46:21 PM
// Design Name: 
// Module Name: t_mux_4to1
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


module t_mux_4to1(

    );
reg [3:0] a, b, c, d;
reg [1:0] sel;
wire [3:0] out;
integer i;

mux_4to1 muxtest(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));

initial begin
#1000 $finish;
end

initial begin
    b[0] = 1;
    b[1] = 1;
    b[2] = 0;
    b[3] = 0;
    c[0] = 1;
    c[1] = 1;
    c[2] = 0;
    c[3] = 0;
    d[0] = 1;
    d[1] = 1;
    d[2] = 0;
    d[3] = 0;
    for (i = 0; i < 64; i = i + 1) begin
        {sel, a} = i;
        #10;
    end
end
endmodule
