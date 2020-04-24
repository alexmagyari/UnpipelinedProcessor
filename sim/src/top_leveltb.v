// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Control TestBench
// This test bench tests the funcitonality the control unit of a processor.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module processorDebugger_tb();
    reg executeButton;
    reg [9:0] switches;
    wire [6:0] ss0, ss1, ss2, ss3, ss4, ss5;
    reg Clk;
    reg Rst;

    processorDebugger endThisPlease(executeButton, switches, ss0, ss1, ss2, ss3, ss4, ss5, Clk, Rst);

    always 
    begin
        Clk = 1;
        #10 Clk = 0;
        #10;
    end

    initial
    begin
        Rst = 1;
        switches = 10'b0000000000;
        executeButton = 0;
        #25
        Rst = 0;
        #20
        Rst = 1;
        switches = 10'b0000001011;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
        executeButton = 1'b1;
        #80
        executeButton = 1'b0;
        #40;
    end
endmodule