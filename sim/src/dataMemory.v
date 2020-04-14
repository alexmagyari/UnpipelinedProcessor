// ECE 5367
// Author: Alexander Magyari 4632
// Data Memory with a write enable for debugging purposes
// This module will initialize and maintain memory for the
// processor. This will only write data with the button push.
// Total memory size is 512 words x 32 bits, the motiviation
// for the size being the limited amount of switches on the
// mini FPGA (9 for address select, 1 for selecting the memory,
// 10 total). The address selection is still 32 bits to coincide
// with a 32 bit processor. Memory is only written to after one clock
// cycle to allow for the IF, which costs one clock cycle.
// 
// Inputs:
//      Clk: Clock
//      Rst: Reset. Initializes the memory
//      memWrite: High if the memory is to be written to
//      memRead: High if the memory is to be read from. Implemented
//               so as to prevent reads from invalid addresses
//      writeEnable: High only if the memory should be written to
//      addr [31:0]: the address to read from or write to or both
//      peekAddr [31:0]: The address being viewed by the debugger
//      writeData [31:0]: the data that should be written to the memory
//      
//      
// Outputs:
//      readData 32b: The data read from addr
//      peekData 32b: The data read from peekAddr
//
//  

module dataMemory(
                 input [31:0] addr,
                 input [31:0] writeData,
                 input [31:0] peekAddr,
                 input memWrite,
                 input memRead,
                 input writeEnable,
                 output reg [31:0] readData,
                 output reg [31:0] peekData,
                 input Clk,
                 input Rst);

    reg [31:0] memory [127:0];
    // reg [31:0] memory [511:0];

    reg State;
    parameter StateIdle = 1'b0, StateWrite = 1'b1;
    integer i;

    always @(posedge Clk)
    begin
        if (Rst == 1'b0)
        begin
            for (i = 0; i < 128; i = i + 1)
            begin
                memory[i] <= i;
            end
            State <= StateIdle;
        end
        else
        begin
            case (State)
                StateIdle:
                begin
                    if (writeEnable == 1)
                    begin
                        State <= StateWrite;
                    end
                    else
                    begin
                        State <= StateIdle;
                    end
                end
                StateWrite:
                begin
                    if (memWrite == 1)
                    begin
                        State <= StateIdle;
                        memory[addr] <= writeData;
                    end
                end
            endcase
        end
    end

    always @(memRead, peekAddr, addr)
    begin
        if (peekAddr < 128)
        begin
            peekData = memory[peekAddr];
        end
        else
        begin
            peekData = memory[127];
        end
        if (memRead == 1)
        begin
            readData = memory[addr];
        end
        else
        begin
            readData = 32'h00000000;
        end
    end
endmodule