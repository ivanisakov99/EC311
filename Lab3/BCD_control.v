`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:09:09 PM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
input [5:0] digit1,
input [5:0] digit2,
input [3:0] digit3,
input [7:0]ans,
input [2:0] refreshcounter,
output reg [7:0] ONE_DIGIT
    );
    
wire [7:0]a1;
wire [7:0]a2;
wire [7:0]ans_inv;
wire [7:0]ans_inv2;   
//assign a2 = ans % 8'b01100100;
assign a1 = ans % 8'b00001010;
assign ans_inv = ~(ans - 8'b00000001);
assign ans_inv2 = ans_inv % 8'b00001010;

always@(refreshcounter)
begin

case(refreshcounter)
    3'd0:                                   //First digit
    begin
        case(digit3)
        4'b0000://Dice Roller
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0001://Comparator
        begin
        if(digit1 == digit2)// A == B
            ONE_DIGIT = 8'b00001110;//E
        else if(digit1 < digit2)//   A < B
            ONE_DIGIT = 8'b00010001;//L
        else if(digit1 > digit2)// A > B
            ONE_DIGIT = 8'b00001011;//B (Bigger than)
        end
        
        4'b0010://Temp Display
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0011://A nor B
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0100://A xor B
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0101://A xnor B
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0110://A'
        begin
        ONE_DIGIT = a1;
        end
        
        4'b0111://B'
        begin
        ONE_DIGIT = a1;
        end
        
        4'b1000://Negate A
        begin
        ONE_DIGIT = ans_inv2;
        end
        
        4'b1001://Negate B
        begin
        ONE_DIGIT = ans_inv2;
//        if(ans_inv < 8'b00001010)
//            ONE_DIGIT = ans_inv;
//        else
//            ONE_DIGIT = ans_inv2;
        end
    
        4'b1010://A + B
        begin
        ONE_DIGIT = a1;
        end
    
        4'b1011://A - B
        begin
        if(digit2 > digit1)
            ONE_DIGIT = ans_inv2;
        else
            ONE_DIGIT = a1;
        end
    
        4'b1100://A * B
        begin
            ONE_DIGIT = a1;
        end
    
        4'b1101://B - A
        begin
        if(digit1 > digit2)
            ONE_DIGIT = ans_inv2;
        else
            ONE_DIGIT = a1;
        end
    
        4'b1110://A + 1
        begin
            ONE_DIGIT = a1;
        end
    
        4'b1111://A - 1
        begin
        if(digit1 == 6'b000000)
            ONE_DIGIT = 8'b00000001;
        else
            ONE_DIGIT = a1;
        end
    
    endcase
    end
    
    
    
    
    3'd1:                                           //Second digit
    begin
    case(digit3)
        
        4'b0000://Dice Roller
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0001://Comparator
        begin
        ONE_DIGIT = 8'b11111111;//empty
        end
        
        4'b0010://Temp Display
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0011://A nor B
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0100://A xor B
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0101://A xnor B
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0110://A'
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        
        4'b0111://B'
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1000://Negate A
        begin
        if(ans_inv < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b00010100 || (ans_inv < 8'b01111000 && ans_inv > 8'b01101101) || (ans_inv < 8'b11011100 && ans_inv > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10000010 && ans_inv > 8'b01110111) || (ans_inv < 8'b11100110 && ans_inv > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;// 2
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10001100 && ans_inv > 8'b10000001) || (ans_inv < 8'b11110000 && ans_inv > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;// 3
        else if(ans_inv < 8'b00110010 || (ans_inv < 8'b10010110 && ans_inv > 8'b10001011) || (ans_inv < 8'b11111010 && ans_inv > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;// 4
        else if(ans_inv < 8'b00111100 || (ans_inv < 8'b10100000 && ans_inv > 8'b10010101) || (ans_inv < 8'b11111111 && ans_inv > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;// 5
        else if(ans_inv < 8'b01000110 || (ans_inv < 8'b10101010 && ans_inv > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;// 6
        else if(ans_inv < 8'b01010000 || (ans_inv < 8'b10110100 && ans_inv > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;// 7
        else if(ans_inv < 8'b01011010 || (ans_inv < 8'b10111110 && ans_inv > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;// 8
        else if(ans_inv < 8'b01100100 || (ans_inv < 8'b11001000 && ans_inv > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9    
        else if(ans_inv < 8'b01101110 || (ans_inv < 8'b11010010 && ans_inv > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1001://Negate B
        begin
        if(ans_inv < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b00010100 || (ans_inv < 8'b01111000 && ans_inv > 8'b01101101) || (ans_inv < 8'b11011100 && ans_inv > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10000010 && ans_inv > 8'b01110111) || (ans_inv < 8'b11100110 && ans_inv > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;// 2
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10001100 && ans_inv > 8'b10000001) || (ans_inv < 8'b11110000 && ans_inv > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;// 3
        else if(ans_inv < 8'b00110010 || (ans_inv < 8'b10010110 && ans_inv > 8'b10001011) || (ans_inv < 8'b11111010 && ans_inv > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;// 4
        else if(ans_inv < 8'b00111100 || (ans_inv < 8'b10100000 && ans_inv > 8'b10010101) || (ans_inv < 8'b11111111 && ans_inv > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;// 5
        else if(ans_inv < 8'b01000110 || (ans_inv < 8'b10101010 && ans_inv > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;// 6
        else if(ans_inv < 8'b01010000 || (ans_inv < 8'b10110100 && ans_inv > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;// 7
        else if(ans_inv < 8'b01011010 || (ans_inv < 8'b10111110 && ans_inv > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;// 8
        else if(ans_inv < 8'b01100100 || (ans_inv < 8'b11001000 && ans_inv > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9    
        else if(ans_inv < 8'b01101110 || (ans_inv < 8'b11010010 && ans_inv > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1010://A + B
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1011://A - B
        begin
        if(digit2 > digit1)
        begin
        if(ans_inv < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b00010100 || (ans_inv < 8'b01111000 && ans_inv > 8'b01101101) || (ans_inv < 8'b11011100 && ans_inv > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10000010 && ans_inv > 8'b01110111) || (ans_inv < 8'b11100110 && ans_inv > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;// 2
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10001100 && ans_inv > 8'b10000001) || (ans_inv < 8'b11110000 && ans_inv > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;// 3
        else if(ans_inv < 8'b00110010 || (ans_inv < 8'b10010110 && ans_inv > 8'b10001011) || (ans_inv < 8'b11111010 && ans_inv > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;// 4
        else if(ans_inv < 8'b00111100 || (ans_inv < 8'b10100000 && ans_inv > 8'b10010101) || (ans_inv < 8'b11111111 && ans_inv > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;// 5
        else if(ans_inv < 8'b01000110 || (ans_inv < 8'b10101010 && ans_inv > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;// 6
        else if(ans_inv < 8'b01010000 || (ans_inv < 8'b10110100 && ans_inv > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;// 7
        else if(ans_inv < 8'b01011010 || (ans_inv < 8'b10111110 && ans_inv > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;// 8
        else if(ans_inv < 8'b01100100 || (ans_inv < 8'b11001000 && ans_inv > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9    
        else if(ans_inv < 8'b01101110 || (ans_inv < 8'b11010010 && ans_inv > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        else
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        end
    
        4'b1100://A * B
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1101://B - A
        begin
        if(digit1 > digit2)
        begin
        if(ans_inv < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b00010100 || (ans_inv < 8'b01111000 && ans_inv > 8'b01101101) || (ans_inv < 8'b11011100 && ans_inv > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10000010 && ans_inv > 8'b01110111) || (ans_inv < 8'b11100110 && ans_inv > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;// 2
        else if(ans_inv < 8'b00011110 || (ans_inv < 8'b10001100 && ans_inv > 8'b10000001) || (ans_inv < 8'b11110000 && ans_inv > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;// 3
        else if(ans_inv < 8'b00110010 || (ans_inv < 8'b10010110 && ans_inv > 8'b10001011) || (ans_inv < 8'b11111010 && ans_inv > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;// 4
        else if(ans_inv < 8'b00111100 || (ans_inv < 8'b10100000 && ans_inv > 8'b10010101) || (ans_inv < 8'b11111111 && ans_inv > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;// 5
        else if(ans_inv < 8'b01000110 || (ans_inv < 8'b10101010 && ans_inv > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;// 6
        else if(ans_inv < 8'b01010000 || (ans_inv < 8'b10110100 && ans_inv > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;// 7
        else if(ans_inv < 8'b01011010 || (ans_inv < 8'b10111110 && ans_inv > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;// 8
        else if(ans_inv < 8'b01100100 || (ans_inv < 8'b11001000 && ans_inv > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9    
        else if(ans_inv < 8'b01101110 || (ans_inv < 8'b11010010 && ans_inv > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        else
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
        end
    
        4'b1110://A + 1
        begin
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    
        4'b1111://A - 1
        begin
        if(digit1 == 0)
            ONE_DIGIT = 8'b11111110;//minus
        else
        if(ans < 8'b00001010) // ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b00010100 || (ans < 8'b01111000 && ans > 8'b01101101) || (ans < 8'b11011100 && ans > 8'b11010001))// ans < 20 || ans < 120 && ans > 109 || ans < 220 && ans > 209
            ONE_DIGIT = 8'b00000001;// 1
        else if(ans < 8'b00011110 || (ans < 8'b10000010 && ans > 8'b01110111) || (ans < 8'b11100110 && ans > 8'b11011011))// ans < 30 || ans < 130 && ans > 119 || ans < 230 && ans > 219
            ONE_DIGIT = 8'b00000010;
        else if(ans < 8'b00011110 || (ans < 8'b10001100 && ans > 8'b10000001) || (ans < 8'b11110000 && ans > 8'b11100101))// ans < 40 || ans < 140 && ans > 129 || ans < 240 && ans > 229
            ONE_DIGIT = 8'b00000011;
        else if(ans < 8'b00110010 || (ans < 8'b10010110 && ans > 8'b10001011) || (ans < 8'b11111010 && ans > 8'b11101111))// ans < 50 || ans < 150 && ans > 139 || ans < 250 && ans > 239
            ONE_DIGIT = 8'b00000100;
        else if(ans < 8'b00111100 || (ans < 8'b10100000 && ans > 8'b10010101) || (ans < 8'b11111111 && ans > 8'b11111001))// ans < 60 || ans < 160 && ans > 149 || ans < 255 && ans > 249
            ONE_DIGIT = 8'b00000101;//
        else if(ans < 8'b01000110 || (ans < 8'b10101010 && ans > 8'b10011111))// ans < 70 || ans < 170 && ans > 159
            ONE_DIGIT = 8'b00000110;//
        else if(ans < 8'b01010000 || (ans < 8'b10110100 && ans > 8'b10101001))// ans < 80 || ans < 180 && ans > 169
            ONE_DIGIT = 8'b00000111;//
        else if(ans < 8'b01011010 || (ans < 8'b10111110 && ans > 8'b10110011))// ans < 90 || ans < 190 && ans > 179
            ONE_DIGIT = 8'b00001000;//
        else if(ans < 8'b01100100 || (ans < 8'b11001000 && ans > 8'b10111101))// ans < 100 || ans < 200 && ans > 189
            ONE_DIGIT = 8'b00001001;// 9  
        else if(ans < 8'b01101110 || (ans < 8'b11010010 && ans > 8'b11000111))// ans < 110 || ans < 210 && ans > 199
            ONE_DIGIT = 8'b00000000;// 0
        end
    endcase
    end



    3'd2:                                                    //Third digit 
    begin
    case(digit3)
        4'b0000://Dice Roller
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2   
        end
        
        4'b0001: ONE_DIGIT = 8'b11111111;//Comparator
        4'b0010: ONE_DIGIT = 8'b11111111;//Temp Display
        
        4'b0011: //A nor B
        begin
            if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
        
        4'b0100://A xor B 
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
        
        4'b0101: //A xnor B
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
        
        4'b0110: //A'
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
        
        4'b0111://B'
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
        
        4'b1000://Negate A
        begin
        if(ans_inv < 8'b00001010)// ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans_inv < 8'b01100100 && ans_inv > 8'b00001001) // ans < 100 && ans > 9
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
    
        4'b1001://Negate B
        begin
        if(ans_inv < 8'b00001010)// ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans_inv < 8'b01100100 && ans_inv > 8'b00001001) // ans < 100 && ans > 9
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2 
        end
    
        4'b1010://A + B
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2
        end
    
        4'b1011://A - B
        begin
        if(digit2 > digit1)
        begin
        if(ans_inv < 8'b00001010)// ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans_inv < 8'b01100100 && ans_inv > 8'b00001001) // ans < 100 && ans > 9
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2  
        end
        else
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2   
        end 
        end
    
        4'b1100://A * B
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2
        end
    
        4'b1101://B - A
        begin
        if(digit1 > digit2)
        begin
        if(ans_inv < 8'b00001010)// ans < 10
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans_inv < 8'b01100100 && ans_inv > 8'b00001001) // ans < 100 && ans > 9
            ONE_DIGIT = 8'b11111110;//minus
        else if(ans_inv < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2  
        end
        else
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2   
        end 
        end
    
        4'b1110://A + 1
        begin
        if(ans < 8'b01100100) // ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2
        end
    
        4'b1111://A - 1
        begin
        if(ans < 8'b01100100 || ans_inv > 8'b00000000) // ans < 100 && ans > 0
            ONE_DIGIT = 8'b11111111;//empty
        else if(ans < 8'b11001000)// ans < 200
            ONE_DIGIT = 8'b00000001;// 1
        else                        // ans > 200
            ONE_DIGIT = 8'b00000010;//2
        end
    
    endcase
    end           
    
    3'd3:                                           // Fourth digit
    begin
        case(digit3)
        4'b0000://Dice Roller
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0001://Comparator
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0010://Temp Display
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0011://A nor B
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0100://A xor B
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0101://A xnor B
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0110://A'
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b0111://B'
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b1000://Negate A
        begin
        if(ans_inv < 8'b01100100)// ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else
            ONE_DIGIT = 8'b11111110;//minus
        end
        4'b1001://Negate B
        begin
        if(ans_inv < 8'b01100100)// ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else
            ONE_DIGIT = 8'b11111110;//minus
        end
        4'b1010://A + B
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b1011://A - B
        begin
        if(digit2 > digit1)
        begin
        if(ans_inv < 8'b01100100)// ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else
            ONE_DIGIT = 8'b11111110;//minus
        end
        else
        begin
        ONE_DIGIT = 8'b11111111;//empty
        end 
        end
        
        4'b1100://A * B
        begin
            ONE_DIGIT = 8'b11111111;
        end
        
        4'b1101://B - A
        begin
        if(digit1 > digit2)
        begin
        if(ans_inv < 8'b01100100)// ans < 100
            ONE_DIGIT = 8'b11111111;//empty
        else
            ONE_DIGIT = 8'b11111110;//minus
        end
        else
        begin
        ONE_DIGIT = 8'b11111111;//empty
        end
        end
        
        4'b1110://A + 1
        begin
            ONE_DIGIT = 8'b11111111;
        end
        4'b1111://A - 1
        begin
            ONE_DIGIT = 8'b11111111;
        end
    endcase
    end
    3'd4: ONE_DIGIT = 8'b11111111;// Fifth digit
    3'd5: ONE_DIGIT = 8'b11111111;// Sixth digit
    3'd6: ONE_DIGIT = 8'b11111111;// Seventh digit
    
    3'd7:                                           // Eighth digit
    begin
    case(digit3)
        4'b0000://Dice Roller
        begin
            ONE_DIGIT = 8'b00000000;
        end
        
        4'b0001://Comparator
        begin
            ONE_DIGIT = 8'b00000001;
        end
        
        4'b0010://Temp Display
        begin
            ONE_DIGIT = 8'b00000010;
        end
        
        4'b0011://A nor B
        begin
            ONE_DIGIT = 8'b00000011;
        end
        
        4'b0100://A xor B
        begin
            ONE_DIGIT = 8'b00000100;
        end
        
        4'b0101://A xnor B
        begin
            ONE_DIGIT = 8'b00000101;
        end
        
        4'b0110://A'
        begin
            ONE_DIGIT = 8'b00000110;
        end
        
        4'b0111://B'
        begin
            ONE_DIGIT = 8'b00000111;
        end
        4'b1000://Negate A
        begin
            ONE_DIGIT = 8'b00001000;
        end
        
        4'b1001://Negate B
        begin
            ONE_DIGIT = 8'b00001001;
        end
        
        4'b1010://A + B
        begin
            ONE_DIGIT = 8'b00001010;
        end
        
        4'b1011://A - B
        begin
            ONE_DIGIT = 8'b00001011;
        end
        
        4'b1100://A * B
        begin
            ONE_DIGIT = 8'b00001100;
        end
        
        4'b1101://B - A
        begin
            ONE_DIGIT = 8'b00001101;
        end
        
        4'b1110://A + 1
        begin
            ONE_DIGIT = 8'b00001110;
        end
        
        4'b1111://A - 1
        begin
            ONE_DIGIT = 8'b00001111;
        end
    endcase
    end

    endcase
    end
endmodule
