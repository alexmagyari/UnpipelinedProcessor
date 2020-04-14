// ECE 5367
// Author: Alexander Magyari 4632
// Sign Extend
// Extends the 16 bit input with a 
// similarly signed output
// 
// Inputs:
//   instruction [15:0]: instruction to be extended
//
// Outputs:
//   q [31:0]: the extended instruction

module signExtend(
                  input [15:0] instruction,
                  output reg [31:0] q
);

    always @(instruction)
    begin
        q = {instruction[15], 16'b000000000000000, instruction[14:0]};
    end
endmodule

