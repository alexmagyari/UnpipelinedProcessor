// ECE 5367
// Author: Alexander Magyari 4632
// ALU Control Module
// This module controls the operation of the third ALU in a
// MIPS processor Design
// 
// Inputs:
//   instruction 6b: which instruction is being processed
//   ALUOp 2b: ALU Op varies depending on the input being an R, I or J type
//
// Outputs:
//   op 4b: The op code for an ALU

module ALUControl(
                input [5:0] instruction,
                input [1:0] ALUOp,
                output reg [3:0] op);

    //J type includes jump and branch
    parameter RType = 2'b10, IType = 2'b00, JType = 2'b01;
    
    // The following parameters are based on the ALU Control input field, 
    // and dictate the output for the ALU based on this input
    // SOLT => Set on less than
    parameter add = 6'b100000, subtract = 6'b100010, AND = 6'b100100,
              OR = 6'b100101, SOLT = 6'b101010, SLLV = 6'b000100;

    always @(instruction, ALUOp)
    begin
        case(ALUOp)
            RType:
            begin
                case (instruction)
                    add:
                    begin
                        op = 4'b0010;
                    end

                    subtract:
                    begin
                        op = 4'b0110;
                    end

                    AND:
                    begin
                        op = 4'b0000;
                    end

                    OR:
                    begin
                        op = 4'b0001;
                    end

                    SOLT:
                    begin
                        op = 4'b0111;
                    end

                    SLLV:
                    begin
                        op = 4'b0100;
                    end
                    default:
                    begin
                        op = 4'b0000;
                    end

                endcase
            end

            IType:
            begin
                op = 4'b0010;
            end

            JType:
            begin
                op = 4'b0110;
            end

            default:
            begin
                op = 4'b0000;
            end
        endcase
    end
endmodule
