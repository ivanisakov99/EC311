`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2020 08:35:23 PM
// Design Name: 
// Module Name: segment7
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


module segment7(
    input mode,
    input  [3:0]x,
    input  [3:0]y,
    input  [3:0]i,
    input  [3:0]ans,
    output reg [6:0]za,
    output reg [6:0]zb,
    output reg [6:0]zc,
    output reg [6:0]zd,
    output reg [6:0]ze,
    output reg [6:0]zf,
    output reg [6:0]zg,
    output reg [6:0]zh    
    );
    
   reg [6:0]ai, ao, bi, bo, ci, co;
   wire [6:0] di, do, ei, eo, fi, fo, gi, go, hi, ho;
   assign di = 7'b1111110;
   assign ei = 7'b1111110;
   assign fi = 7'b1111110;
   assign gi = 7'b1111110;
   assign hi = 7'b1111110;
   assign do = 7'b0000000;
   assign eo = 7'b0000000;
   assign fo = 7'b0000000;
   assign go = 7'b0000000;
   assign ho = 7'b0000000;
   
always @(*)
begin
    case (y)
    4'b0000 :      	//Hexadecimal 0
    ai = 7'b1111110;
    4'b0001 :    		//Hexadecimal 1
    ai = 7'b0110000  ;  
    4'b0010 :  		// Hexadecimal 2
    ai = 7'b1101101 ; 
    4'b0011 : 		// Hexadecimal 3
    ai = 7'b1111001 ;
    4'b0100 :		// Hexadecimal 4
    ai = 7'b0110011 ;
    4'b0101 :		// Hexadecimal 5
    ai = 7'b1011011 ;  
    4'b0110 :		// Hexadecimal 6
    ai = 7'b1011111 ;
    4'b0111 :		// Hexadecimal 7
    ai = 7'b1110000;
    4'b1000 :     		 //Hexadecimal 8
    ai = 7'b1111111;
    4'b1001 :    		//Hexadecimal 9
    ai = 7'b1111011 ;
    4'b1010 :  		// Hexadecimal A
    ai = 7'b1110111 ; 
    4'b1011 : 		// Hexadecimal B
    ai = 7'b0011111;
    4'b1100 :		// Hexadecimal C
    ai = 7'b1001110 ;
    4'b1101 :		// Hexadecimal D
    ai = 7'b0111101 ;
    4'b1110 :		// Hexadecimal E
    ai = 7'b1001111 ;
    4'b1111 :		// Hexadecimal F
    ai = 7'b1000111 ;
endcase

case (x)
    4'b0000 :      	//Hexadecimal 0
    bi = 7'b1111110;
    4'b0001 :    		//Hexadecimal 1
    bi = 7'b0110000  ;  
    4'b0010 :  		// Hexadecimal 2
    bi = 7'b1101101 ; 
    4'b0011 : 		// Hexadecimal 3
    bi = 7'b1111001 ;
    4'b0100 :		// Hexadecimal 4
    bi = 7'b0110011 ;
    4'b0101 :		// Hexadecimal 5
    bi = 7'b1011011 ;  
    4'b0110 :		// Hexadecimal 6
    bi = 7'b1011111 ;
    4'b0111 :		// Hexadecimal 7
    bi = 7'b1110000;
    4'b1000 :     		 //Hexadecimal 8
    bi = 7'b1111111;
    4'b1001 :    		//Hexadecimal 9
    bi = 7'b1111011 ;
    4'b1010 :  		// Hexadecimal A
    bi = 7'b1110111 ; 
    4'b1011 : 		// Hexadecimal B
    bi = 7'b0011111;
    4'b1100 :		// Hexadecimal C
    bi = 7'b1001110 ;
    4'b1101 :		// Hexadecimal D
    bi = 7'b0111101 ;
    4'b1110 :		// Hexadecimal E
    bi = 7'b1001111 ;
    4'b1111 :		// Hexadecimal F
    bi = 7'b1000111 ;
endcase

case (i)
    4'b0000 :      	//Hexadecimal 0
    ci = 7'b1111110;
    4'b0001 :    		//Hexadecimal 1
    ci = 7'b0110000  ;  
    4'b0010 :  		// Hexadecimal 2
    ci = 7'b1101101 ; 
    4'b0011 : 		// Hexadecimal 3
    ci = 7'b1111001 ;
    4'b0100 :		// Hexadecimal 4
    ci = 7'b0110011 ;
    4'b0101 :		// Hexadecimal 5
    ci = 7'b1011011 ;  
    4'b0110 :		// Hexadecimal 6
    ci = 7'b1011111 ;
    4'b0111 :		// Hexadecimal 7
    ci = 7'b1110000;
    4'b1000 :     		 //Hexadecimal 8
    ci = 7'b1111111;
    4'b1001 :    		//Hexadecimal 9
    ci = 7'b1111011 ;
    4'b1010 :  		// Hexadecimal A
    ci = 7'b1110111 ; 
    4'b1011 : 		// Hexadecimal B
    ci = 7'b0011111;
    4'b1100 :		// Hexadecimal C
    ci = 7'b1001110 ;
    4'b1101 :		// Hexadecimal D
    ci = 7'b0111101 ;
    4'b1110 :		// Hexadecimal E
    ci = 7'b1001111 ;
    4'b1111 :		// Hexadecimal F
    ci = 7'b1000111 ;
endcase

if(mode == 4'b1000 && x > 4'b0000)
begin
    co = 7'b1111110;
end
    
else if(mode == 4'b1001 && y > 4'b0000)
begin
    co = 7'b1111110;
end 

else if(mode == 4'b1011 && x == 4'b0000)
begin 
    co = 7'b1111110;
end

else if(mode == 4'b1101 && y == 4'b000)
begin
    co = 7'b1111110;
end

else if (mode == 4'b1111 && x == 4'b0000)
begin 
    co = 7'b1111110;
end

else
begin 
    co = 7'b0000000;
end

if(ans > 4'b1001)
begin
    ao = 7'b1001111;
end


case(ans)
    4'b0000: 
    ao = 7'b0000001;
    4'b0001: 
    ao = 7'b1001111;
    4'b0010: 
    ao = 7'b0010010;
    4'b0011: 
    ao = 7'b0000110;
    4'b0100: 
    ao = 7'b1001100;
    4'b0101: 
    ao = 7'b0100100;
    4'b0110: 
    ao = 7'b0100000;
    4'b0111: 
    ao = 7'b0001111;
    4'b1000: 
    ao = 7'b0000000;
    4'b1001: 
    ao = 7'b0000100;
    
    4'b1010: 
    bo = 7'b0000001;
    4'b1011: 
    bo = 7'b1001111;
    4'b1100: 
    bo = 7'b0010010;
    4'b1101: 
    bo = 7'b0000110;
    4'b1110: 
    bo = 7'b1001100;
    4'b1111: 
    bo = 7'b0100100;
    
    default:
    ao = 7'b0000001;
endcase


end

mux muxa(.mode(mode), .x(ao), .y(ai), .out(za));
mux muxb(.mode(mode), .x(bo), .y(bi), .out(zb));
mux muxc(.mode(mode), .x(co), .y(ci), .out(zc));
mux muxd(.mode(mode), .x(do), .y(di), .out(zd));
mux muxe(.mode(mode), .x(eo), .y(ei), .out(ze));
mux muxf(.mode(mode), .x(fo), .y(fi), .out(zf));
mux muxg(.mode(mode), .x(go), .y(gi), .out(zg));
mux muxh(.mode(mode), .x(ho), .y(hi), .out(zh));


endmodule