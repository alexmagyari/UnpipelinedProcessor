// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Left Shift TB
// This test bench shifts the input to the left two bits, and should replace all 
// unknown inputs with 0s.
//
//
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module signExtend_tb();

    reg [15:0] instruction;
    wire [31:0] q;
    

    signExtend DUT_SE(instruction, q);

    initial
        begin
            instruction = 16'b0000001111100000;
            #10
            instruction = 16'b1111110000011111;
        end
endmodule
