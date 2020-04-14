// ECE 5367
// Author: Alexander Magyari 4632
// Control Module
// This module controls the operation of an unpipelined processor
// 
// Inputs:
//   instruction [5:0]: which instruction is being processed
//   clk: clock input
//   rst: reset input
//
// Outputs:
//   RegDst: High if rd is contained in the instruction (R-type)
//   ALUSrc: High for I type instructions
//   MemtoReg: High on loading memory to a register
//   RegWrite: High if Registers are to be written to
//   MemRead: High if the memory is to be read from
//   MemWrite: High if memory is to be written to
//   Branch: Only high for branch instructions
//   Jump: Only high for jump instructions
//   ALUOp [1:0]: The ALU operation to run in the ALU control module

module control(
                input [5:0] instruction,
                output reg RegDst,
                output reg ALUSrc,
                output reg MemtoReg,
                output reg RegWrite,
                output reg MemRead,
                output reg MemWrite,
                output reg Branch,
                output reg Jump,
                output reg [1:0] ALUOp,
                input Clk, 
                input Rst);

    parameter RType = 6'b000000, loadWord = 6'b100011,
              storeWord = 6'b101011, branchEquals = 6'b000100,
              jump = 6'b000010;

    always @(posedge Clk)
    begin
        if (Rst == 1'b0)
        begin
            RegDst = 0;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            Jump = 0;
            ALUOp = 2'b00;
        end
        else
        begin
            case(instruction)
                RType:
                begin
                    RegDst = 1;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    RegWrite = 1;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 0;
                    Jump = 0;
                    ALUOp = 2'b10;
                end

                loadWord:
                begin
                    RegDst = 0;
                    ALUSrc = 1;
                    MemtoReg = 1;
                    RegWrite = 1;
                    MemRead = 1;
                    MemWrite = 0;
                    Branch = 0;
                    Jump = 0;
                    ALUOp = 2'b00;
                end

                storeWord:
                begin
                    RegDst = 0;
                    ALUSrc = 1;
                    MemtoReg = 0;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 1;
                    Branch = 0;
                    Jump = 0;
                    ALUOp = 2'b00;
                end

                branchEquals:
                begin
                    RegDst = 0;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 1;
                    Jump = 0;
                    ALUOp = 2'b01;
                end

                jump:
                begin
                    RegDst = 0;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 0;
                    Jump = 1;
                    ALUOp = 2'b01;
                end

                default:
                begin
                    RegDst = 0;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 0;
                    Jump = 0;
                    ALUOp = 2'b00;
                end
            endcase
        end
    end
endmodule
