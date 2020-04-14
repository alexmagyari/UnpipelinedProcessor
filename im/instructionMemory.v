// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Instruction Memory
// Loads all the instructions located in. This module is not
// clocked - it runs at the pace of the PC.
// 
// Constants
//      memorySize: The size of memory in Bytes
//
// Inputs:
//      programCounter [31:0]: Points to which instruction to read 
//      Rst: Loads the data from the memory initialization file.
//
// Outputs:
//      instruction: The instruction that has been read

`define memorySize 10

module instructionMemory(
                  input [31:0] programCounter,
                  output reg [31:0] instruction,
                  input Rst);

    reg [7:0] rom [(`memorySize - 1):0]; 

    always @(programCounter, Rst)
    begin
        if(Rst == 1'b0)
        begin
            $readmemh("instructions.mem", rom);
        end
        
        begin
            if (programCounter > `memorySize - 3)
            begin  
                instruction <= 32'h00000000;
            end
            else
            begin
                instruction <= {rom[programCounter], rom[programCounter + 1], rom[programCounter + 2], rom[programCounter + 3]};
            end
        end   
    end
endmodule