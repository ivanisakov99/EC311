`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2020 11:38:54 PM
// Design Name: 
// Module Name: ClockFSM
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


module ClockFSM(
    input [5:0]data,
    input [1:0]mode,
    input ampm,
    input inconfirm,
    input clk,
    input alarmen,
    input alarmin,
    
    output reg [4:0] hours,
    output reg [5:0] minutes,
    output reg [5:0] seconds,
    output wire alarm,
    output reg am
    );
    wire confirm; 
    reg [4:0] clkhours;
    wire oclk;
    reg alarmset;
    reg almenin;
    reg [4:0] alarmh;
    reg [5:0] alarmm;
    reg [5:0] alarms;
    reg [2:0] swtch;
    
    debouncer dbconfirm(.clk(clk), .I0(inconfirm), .O0(confirm));
    
    clkdivsec secclk(.clk(clk), .out_clk(oclk));
    
    initial begin
        seconds <= 0;
        minutes <= 0;
        clkhours <= 0;
        swtch <= 0;
        almenin <= 0;
        alarmh <= 0;
        alarmm <= 0;
        alarms <= 5'b10100;
        //alarm <= 0;
        
    end
    
    always @ (posedge oclk) begin
        
        seconds <= seconds + 1;
        
        if(seconds > 58) begin
            seconds <= 0;
            minutes <= minutes + 1;
        end
        if(minutes > 58) begin
            minutes <= 0;
            clkhours <= clkhours + 1;
        end   
        if(clkhours > 23) begin
            clkhours <= 0;
        end
        
        if(ampm == 1) begin
            if(clkhours == 0)begin
                am <= 0;
                hours <= 12;
            end
            else if (clkhours < 12) begin
                am <= 0;
                hours <= clkhours;
            end
            else if (clkhours == 12) begin
                am <= 1;
                hours <= 12;
            end
            else begin
                am = 1;
                hours <= clkhours - 12;
            end
        end
        else begin
            hours <= clkhours;
        end
        
        
        
        case(mode)
        2'b01 : begin //set time
            
            case(swtch)
                3'b001 : begin
                    clkhours <= data[4:0];
                end
                3'b010 : begin
                    minutes <= data;
                end
                3'b011 : begin
                    seconds <= data;
                end
                
            endcase
        end
        
        2'b10 : begin //set alarm
            
            case(swtch)
                3'b001 : begin
                    alarmh <= data[4:0];
                end
                3'b010 : begin
                    alarmm <= data;
                end
                3'b011 : begin
                    alarms <= data;
                end
                
            endcase
        end
        default : begin end
        endcase
        
//        if(alarmen == 1 && alarmh == clkhours && alarmm == minutes && alarms == seconds) begin //is alarm enabled and is the time right
//            alarmset <= 1;
//        end
            
//        if(alarmen == 0) begin //prevent alarm from going off
//            alarmset <= 0;
//        end
        
//        if(alarmset == 1) begin //blink LED on and off
//            almenin = 1;
//        end
        
    end
    always @(posedge confirm)
    begin
        if (confirm == 1) begin
            swtch <= swtch + 1;
        end
        
        if (swtch > 2'b11)
        begin
            swtch <= 0;
        end
    end
    always@(posedge clk)
    begin
    if(alarmen == 1 && alarmh == clkhours && alarmm == minutes && alarms == seconds) 
    begin //is alarm enabled and is the time right
        
//    end
//    end
            alarmset <= 1;
        end
            
        if(alarmen == 0) 
        begin //prevent alarm from going off
            alarmset <= 0;
        end
        
//        if(alarmset == 1) begin //blink LED on and off
//            alarm = ~alarm;
//        end
//        else
//        begin
//        alarm = 0;
//        end
       end
   
        LED led ( .clk(clk), .led(alarm), .alarmen(alarmset));
 
    
   
    
    

    

    //almsound alm(.clk(clk), .enable(almenin), .alarm(alarm));
    
endmodule
