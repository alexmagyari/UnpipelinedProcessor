// ECE 5440/6370 
// Author: Alexander Magyari 4632
// ALU 
// Logic unit for two thirty two bit inputs 
// 

// Inputs:
//      A [31:0]: Input A
//      B [31:0]: Input B
//      control [3:0]: Selects the operation -
//                     4'b0000: AND
//                     4'b0001: OR
//                     4'b0010: add
//                     4'b0110: subtract
//                     4'b0111: set on less than
//                     4'b1100: NOR
//                     default: 0
//
// Outputs:
//      Y [31:0]: Equal to A control B
//      Zero: High if A control B == 0

module alu(
                  input [31:0] A,
                  input [31:0] B,
                  input [3:0] control,
                  output reg [31:0] Y,
                  output reg Zero);

    always @(A, B, control)
    begin
        case(control)
            4'b0000:
            begin
                Y = A & B;
            end

            4'b0001:
            begin
                Y = A | B;
            end

            4'b0010:
            begin
                Y = A + B;
            end

            4'b0110:
            begin
                Y = A - B;
            end

            4'b0111:
            begin
                Y = (A < B) ? 1 : 0;
            end

            4'b1100:
            begin
                Y = ~(A | B);
            end

            default:
            begin
                Y = 32'h00000000;
            end
        endcase
        Zero = (Y == 0) ? 1'b1 : 1'b0;
    end
endmodule