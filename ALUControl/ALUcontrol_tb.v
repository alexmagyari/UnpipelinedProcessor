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

    ALUControl DUT_ALUControl(instruction, ALUOp, op);


    initial
    begin
        instruction = 6'b000000;
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
        #20
        instruction = 6'b000100;
    end
endmodule