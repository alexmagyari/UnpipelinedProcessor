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

module leftShift_tb();

    reg [25:0] instruction;
    reg [31:0] sendIns;
    wire [31:0] q;
    

    shiftLeft2 DUT_shiftLeft2(sendIns, q);

    initial
        begin
            instruction = 26'b1110001110001110001110001;
            sendIns = {8'b00000000, instruction};
            #10
            instruction = 26'b0001110001110001110001110;
            sendIns = {8'b00000000, instruction};
        end
endmodule
