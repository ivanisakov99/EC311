`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//          
// Create Date: 10/14/2020 09:53:28 PM
// Design Name: 
// Module Name: Full_system
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


module Full_system(
input [5:0]switch,//Switches
input ampm,//Switch
input inconfirm,//Button
input alarmen,//Switch
input [1:0]mode,
input clk,
input alarmIn,
//input c_in,

output [7:0]anode,
output wire o_Segment_A,
output wire o_Segment_B,
output wire o_Segment_C,
output wire o_Segment_D,
output wire o_Segment_E,
output wire o_Segment_F,
output wire o_Segment_G,
output wire alarm
//output  wire audio
    );
    
//wire [7:0]ans;
wire [4:0]hours;
wire [5:0]minutes;
wire [5:0]seconds;
wire am;
//or(audio, 1, 1);

//buf(audio, 1);


ClockFSM ClockFSM(.data(switch[5:0]), 
                  .mode(mode[1:0]), 
                  .ampm(ampm), 
                  .inconfirm(inconfirm), 
                  .clk(clk), 
                  .alarmen(alarmen),  
                  .alarmin(alarmIn),
                   
                  .hours(hours), 
                  .minutes(minutes), 
                  .seconds(seconds), 
                  .alarm(alarm),
                  .am(am));

top top_module(.clk(clk), 
               .hours(hours), 
               .minutes(minutes), 
               .seconds(seconds), 
               .ampm(ampm), 
               .am(am), 
               
               .anode(anode), 
               .o_Segment_A(o_Segment_A), 
               .o_Segment_B(o_Segment_B), 
               .o_Segment_C(o_Segment_C), 
               .o_Segment_D(o_Segment_D), 
               .o_Segment_E(o_Segment_E), 
               .o_Segment_F(o_Segment_F), 
               .o_Segment_G(o_Segment_G));  

endmodule
