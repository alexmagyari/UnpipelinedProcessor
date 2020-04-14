// ECE 5367
// Author: Alexander Magyari 4632
// Left Shift 2 bits
// This module shifts the input 2 bits
// 
// Inputs:
//   instruction [31:0]: the instruction to be shifted
//
// Outputs:
//   q [31:0]: the shifted instruction

module shiftLeft2(
                  input [31:0] instruction,
                  output reg [31:0] q
);

    always @(instruction)
    begin
        q[31:0] = instruction << 2;
    end

endmodule
