// ECE 5367
// Author: Alexander Magyari 4632
// Program Counter
// This is a clocked program counter for a processor
// with an enable bit for to load the new pc in.
// 
// Inputs:
//   in [31:0]: Address to access
//   enable: Loads the new pc value in when high
//   Clk
//   Rst
//
// Outputs:
//   q [31:0]: outputs address

module pc(
          input [31:0] in,
          output reg[31:0] q,
          input enable,
          input Clk,
          input Rst);
    
    always @(posedge Clk)
    if (Rst == 1'b0)
    begin
        q <= 32'h00000000;
    end
    else
    begin
        if (enable == 1)
        begin
            q <= in;
        end
    end
endmodule

