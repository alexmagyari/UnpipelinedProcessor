// ECE 5367
// Author: Alexander Magyari 4632
// Sign Extend
// Extends the 16 bit input with a 
// similarly signed output
// 
// Inputs:
//   instruction 16b: instruction to be extended
//
// Outputs:
//   q 32b: the extended instruction

module signExtend(
                  input [15:0] instruction,
                  output reg [31:0] q);

    always @(instruction)
    begin
        q = {{16{instruction[15]}}, instruction};
    end
endmodule

