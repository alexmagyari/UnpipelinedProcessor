// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Instruction Access
// This test bench combines the Instruction Memory,
// program counter, and an ALU to test the functionality
// of retrieving program commands on a clock edge. For the
// purpose of the debugger, the pc is only loaded via the new
// value on a button press.
// 
// Inputs: None
//
// Outputs: None
`timescale 10ns/100ps

module if_tb();
    wire [31:0] addr;
    wire [31:0] newAddr;
    wire [31:0] instruction;
    reg buttonPress;
    reg Rst, Clk;

    parameter add = 4'b0010;
    parameter four = 32'b00000000000000000000000000000100;


    alu adder(addr, four, add, newAddr);
    pc programcCounter(newAddr, addr, buttonPress, Clk, Rst);
    instructionMemory memory(addr, instruction, Rst);

    always 
    begin
            Clk = 1;
        #10 Clk = 0;
        #10;
    end

    initial
    begin
        Rst = 1;
        buttonPress = 0;
        #20
        Rst = 0;
        #20
        Rst = 1;
        #60
        buttonPress = 1;
        #20
        buttonPress = 0;
        #60
        buttonPress = 1;
        #20
        buttonPress = 0;
        #60
        buttonPress = 1;
        #20
        buttonPress = 0;
        #60
        buttonPress = 1;
        #20
        buttonPress = 0;
    end

endmodule
