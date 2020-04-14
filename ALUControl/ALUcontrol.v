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

module ALUControl(
                input [5:0] instruction,
                input [1:0] ALUOp,
                output reg [3:0] op,
                input Clk,
                input Rst);

    parameter RType = 2'b10, IType = 2'b00, JType = 2'b01;
    
    // The following parameters are based on the ALU Control input field, 
    // and dictate the output for the ALU based on this input
    // SOTL => Set on less than
    parameter add = 6'b100000, subtract = 6'b100010, AND = 6'b100100,
              OR = 6'b100101, SOTL = 101010;
    always @(posedge Clk)
    begin
        if (Rst == 1'b0)
        begin
            op <= 4'b0000;
        end
        else
        begin
            case(ALUOp)
                RType:
                begin
                    case (instruction)
                        add:
                        begin
                            op <= 4'b0010;
                        end

                        subtract:
                        begin
                            op <= 4'b0110;
                        end

                        AND:
                        begin
                            op <= 4'b0000;
                        end

                        OR:
                        begin
                            op <= 4'b0001;
                        end

                        SOTL:
                        begin
                            op <= 4'b0111;
                        end

                        default:
                        begin
                            op <= 4'b0000;
                        end

                    endcase
                end

                IType:
                begin
                    op <= 4'b0010;
                end

                JType:
                begin
                    op <= 4'b0110;
                end

                default:
                begin
                    op <= 4'b0000;
                end
            endcase
        end
    end
endmodule
