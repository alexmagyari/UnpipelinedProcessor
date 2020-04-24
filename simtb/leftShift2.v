// ECE 5367
// Author: Alexander Magyari 4632
// Left Shift 2 bits
// This module shifts the input 2 bits. This has since
// been implemented in the top level architecture without
// this module.
// 
// Inputs:
//   instruction 32b: the instruction to be shifted
//
// Outputs:
//   q 32b: the shifted instruction

module shiftLeft2(
                  input [31:0] instruction,
                  output reg [31:0] q
);

    always @(instruction)
    begin
        q[31:0] = instruction << 2;
    end

endmodule
