// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Control TestBench
// This test bench tests the funcitonality the control unit of a processor.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module ALUControl_tb();
    reg [5:0] instruction;
    reg [1:0] ALUOp;
    wire [3:0] op;
    reg Clk;
    reg Rst;

    ALUControl DUT_ALUControl(instruction, ALUOp, op, Clk, Rst);

    always 
    begin
        #10 Clk = 1;
        #10 Clk = 0;
    end

    initial
    begin
        Rst = 1;
        instruction = 6'b000000;
        ALUOp = 2'b00;
        #20
        Rst = 0;
        #20
        Rst = 1;
        #20
        ALUOp = 2'b00;
        #20
        ALUOp = 2'b01;
        #20
        ALUOp = 2'b10;
        #20
        instruction = 6'b100000;
        #20
        instruction = 6'b100010;
        #20
        instruction = 6'b100100;
        #20
        instruction = 6'b100101;
        #20
        instruction = 6'b101010;
    end
endmodule