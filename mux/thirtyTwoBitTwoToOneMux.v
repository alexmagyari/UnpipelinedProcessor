// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Four Bit Two to One Mux
// Multiplexor with Two-Four Bit Inputs
// 

// Inputs:
//      A: Input A
//      B: Input B
//      select: Selects A or B
//
// Outputs:
//      Y: Equal to A when select is low, equal to B when select is high


module fourBitTwoToOneMux(
                  input [31:0] A,
                  input [31:0] B,
                  input select,
                  output reg [31:0] Y);

    always @(select, A, B)
    begin
        Y = (select == 1'b0) ? A : B;
    end 
endmodule