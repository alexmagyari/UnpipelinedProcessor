// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Random Number Generator Test Bench
// Test bench for Random Number Generator
// 
// Expected result: The random number will increase
//                  by one when the b_In is low on
//                  the rising clock edge
//
// Inputs: None
//
// Outputs: None

`timescale 10ns/100ps

module im_tb();

    reg rst;
    reg [31:0] pc;
    wire [31:0] instruction;

    instructionMemory DUT_instructionMemory(pc, instruction, rst);


    initial
    begin
        rst = 1;
        pc = 32'h00000000;
        #5 rst = 0;
        #20 rst = 1;
        #30 pc = 32'h00000004;
        #30 pc = 32'h00000008;
        #30 pc = 32'h0000000C;
        #30 pc = 32'h00000010;
        #30 pc = 32'h00000014;
    end
endmodule
