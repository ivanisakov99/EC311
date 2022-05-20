`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:10:28 PM
// Design Name: 
// Module Name: Temperature
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


module Temperature(
    output [7:0] tempout
    );
    reg clk;
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    wire enable;  
    wire ready;
    wire [15:0] xadc_raw_out;
    reg [15:0] xadc_in = 16'b0000_0000_0000_0000; 
    wire [11:0] temperature;
    wire [4:0] ch = 1'b0;
    reg [6:0] addr = 7'h00;

xadc_wiz_0 xadc
    (
        .daddr_in(addr),            // Address bus for the dynamic reconfiguration port
        .dclk_in(clk),             // Clock input for the dynamic reconfiguration port
        .den_in(enable),              // Enable Signal for the dynamic reconfiguration port
        .di_in(xadc_in),               // Input data bus for the dynamic reconfiguration port
        .dwe_in(1'd0),              // Write Enable for the dynamic reconfiguration port
        .reset_in(1'd0),            // Reset signal for the System Monitor control logic
        .busy_out(),            // ADC Busy signal
        .channel_out(ch),         // Channel Selection Outputs
        .do_out(xadc_raw_out),              // Output data bus for dynamic reconfiguration port
        .drdy_out(ready),            // Data ready signal for the dynamic reconfiguration port
        .eoc_out(enable),             // End of Conversion Signal
        .eos_out(),             // End of Sequence Signal
        .alarm_out()           // OR'ed output of all the Alarms
    );         
    
    assign temperature = xadc_raw_out[15:4];











wire [11:0] temparature;
assign temparature = 12'b000000100001;

assign tempout = temparature[7:0];

endmodule
