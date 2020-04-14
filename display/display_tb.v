// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Display TestBench
// This test bench tests the funcitonality the display module.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module display_tb();
    reg [9:0] switches;
    reg [31:0] regData, memData, address;
    wire [4:0] regToPeek;
    wire [31:0] memToPeek;
    reg Clk,Rst;
    wire [4:0] ss0, ss1, ss2, ss3, ss4, ss5;

    display DUT_display(switches, regData, memData, address, ss0, ss1, ss2, ss3, ss4, ss5, regToPeek, memToPeek, Clk, Rst);

    always 
    begin
        Clk = 1;
        #10 Clk = 0;
        #10;
    end

    initial
    begin
        Rst = 1;
        regData = 32'h00000000;
        memData = 32'h00000000;
        switches = 9'b000000000;
        address = 32'h00000000;
        #20
        Rst = 0;
        #20
        Rst = 1;
        #20
        address = 32'h11111111;
        memData = 32'h33333333;
        regData = 32'h99999999;
        #20
        switches = 10'b1111111111;
        #20
        switches = 10'b1100011111;
        #20
        switches = 10'b1000000000;
        #20;
    end
endmodule