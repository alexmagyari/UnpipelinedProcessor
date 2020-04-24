// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Control TestBench
// This test bench tests the funcitonality the control unit of a processor.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module control_tb();
    reg [5:0] instruction;
    wire RegDst;
    wire ALUSrc;
    wire MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire BranchE;
    wire BranchNE;
    wire Jump;
    wire [1:0] ALUOp;

    control DUT_control(instruction, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, BranchE, BranchNE, Jump, ALUOp);


    initial
    begin
        instruction = 6'b000000;
        #20
        instruction = 6'b100011;
        #20
        instruction = 6'b101011;
        #20
        instruction = 6'b000100;
        #20
        instruction = 6'b000101;
        #20
        instruction = 6'b000010;
        #20
        instruction = 6'b000000;
    end
endmodule