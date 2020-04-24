// ECE 5440/6370 
// Author: Alexander Magyari 4632
// BCD TestBench
// This test bench tests the funcitonality the BCD module.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module BCD_tb();
    reg [7:0] hex;
    wire [3:0] d1;
    wire [3:0] d10;
    reg Clk, Rst;

    BCD DUT_BCD(hex, d1, d10);

    always 
    begin
        Clk = 1;
        #10 Clk = 0;
        #10;
    end

    initial
    begin
        Rst <= 1;
        #5
        Rst <= 0;
        #20 
        Rst <= 1;
        hex <= 8'h45;
        #20
        hex  <= 8'h63;
        #20
        hex <= 8'h08;
        #20
        hex <= 8'h00;
        #20 
        hex <= 8'h4D;
    end
endmodule