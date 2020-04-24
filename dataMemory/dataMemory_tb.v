// ECE 5367
// Author: Alexander Magyari
// Registers Module Test Bench
// 
// Expected result: The memory output should initially be
//                  the address of the memory, and then it 
//                  should be the saved value in the memory.
//
// Inputs: None
//
// Outputs: None

`timescale 10ns/100ps

module dataMemory_tb();

    reg clk, rst;
    reg [31:0] addr, writeData, peekAddr;
    reg memWrite, memRead, writeEnable;
    wire [31:0] readData, peekData;

    dataMemory DUT_mem(addr, writeData, peekAddr, memWrite, memRead, writeEnable, readData, peekData, clk, rst);
                // input [31:0] addr,
                // input [31:0] writeData,
                // input [31:0] peekAddr,
                // input memWrite,
                // input memRead,
                // input writeEnable,
                // output reg [31:0] readData,
                // output reg [31:0] peekData,
                // input Clk,
                // input Rst);

    // Clock period of 20 ns
    always 
    begin
            clk = 1;
        #10 clk = 0;
        #10;
    end

    initial
    begin
        rst = 1;
        memWrite = 1'b0;
        memRead = 1'b0;
        writeEnable = 1'b0;
        addr = 32'h00000000;
        peekAddr = 32'h00000000;
        writeData = 32'h00000000;
        #5 rst = 0;
        #20 rst = 1; 
        addr = 32'h00000003;
        peekAddr = 32'h00000001;
        #20
        addr = 32'h00000005;
        peekAddr = 32'h00000002;
        memRead = 1'b1;
        #40       
        memRead = 1'b0;
        writeData = 32'h00000005;
        peekAddr = 32'h00000001;
        #20
        memWrite = 1'b1;
        #20
        writeEnable = 1'b1;
        #20
        writeEnable = 1'b0;
        memWrite = 1'b0;
        #40
        memRead = 1'b1;
        #20;
    end
endmodule
