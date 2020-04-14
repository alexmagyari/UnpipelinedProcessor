// ECE 5367
// Author: Alexander Magyari
// Registers Module Test Bench
// 
// Expected result: The read reg values will only change
//                  once a register has been written to.
//
// Inputs: None
//
// Outputs: None

`timescale 10ns/100ps

module registers_tb();

    reg clk, rst;
    reg regWrite;
    reg [4:0] readReg1, readReg2, writeReg;
    reg [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;

    registers DUT_registers(regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2, clk, rst);
                //  input regWrite,
                //  input [4:0] readReg1,
                //  input [4:0] readReg2,
                //  input [4:0] writeReg,
                //  input [31:0] writeData,
                //  output reg [31:0] readData1,
                //  output reg [31:0] readData2,
                //  input Clk,
                //  input Rst);

    // Clock period of 20 ns
    always 
    begin
        #10 clk = 1;
        #10 clk = 0;
    end

    initial
    begin
        rst = 1;
        clk = 0;
        regWrite = 1'b0;
        readReg1 = 5'b00000;
        readReg2 = 5'b00000;
        writeReg = 5'b00000;
        writeData = 32'h00000000;
        #5 rst = 0;
        #20 rst = 1;
        #30 
        readReg1 = 5'b01000;
        readReg2 = 5'b01010;
        writeReg = 5'b01010;
        writeData = 32'h11112222;
        #20 
        regWrite = 1'b1;
        #40
        regWrite = 1'b0;
        readReg1 = 5'b01010;

    end
endmodule
