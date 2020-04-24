// ECE 5367
// Author: Alexander Magyari 4632
// Display Module for the Debugger
// This module dictates what signals are sent to the
// seven segment display. If the switch[9] is high, the
// seven segment displays show the memory in switches
// 0-8. If the switch is low, the seven segment displays 
// display the values in the register dictacted by 
// switches 0-4.
// 
// Inputs:
//      Clk: Clock
//      Rst: Reset
//      address 32b: The address of the instruction that is
//                   about to execute.
//      switches 10b: The ten flip switches on the board
//      regData 32b: The data in the selected register
//      memData 32b The data in the selected memory location
//      
//      
//      
// Outputs:
//      ss0 4b: Seven Segment Display0
//      ss1 4b: Seven Segment Display1
//      ss2 4b: Seven Segment Display2
//      ss3 4b: Seven Segment Display3
//      ss4 4b: Seven Segment Display4
//      ss5 4b: Seven Segment Display5
//      regToPeek 5b: Which register to look at. Selected by
//                    a series of flip switches.
//      memToPeek 32b: Which memory locaiton to look at. Selected
//                     by a series of flip switches.
//  

module display(
                 input [9:0] switches,
                 input [31:0] regData,
                 input [31:0] memData,
                 input [31:0] address,
                 output reg [3:0] ss0,
                 output reg [3:0] ss1,
                 output reg [3:0] ss2,
                 output reg [3:0] ss3,
                 output wire [3:0] ss4,
                 output wire [3:0] ss5,
                 output reg [4:0] regToPeek,
                 output reg [31:0] memToPeek,
                 input Clk,
                 input Rst);

    wire [31:0] line;
    assign line = (address >> 2);
    // Converts 8b to BCD for display
    BCD BCDModule(line[7:0], ss4, ss5);

    always @(switches, regData, memData, address, Rst)
    begin
        if (Rst == 1'b0)
        begin
            ss0 = 4'b0000;
            ss1 = 4'b0000;
            ss2 = 4'b0000;
            ss3 = 4'b0000;
            regToPeek = 5'b00000;
            memToPeek = 32'h00000000;
        end
        else
        begin
            regToPeek = switches[4:0];
            memToPeek = {20'h00000, 3'b000, switches[8:0]};
            case (switches[9])
                0:
                begin
                    ss0 = regData[3:0];
                    ss1 = regData[7:4];
                    ss2 = regData[11:8];
                    ss3 = regData[15:12];
                end
                1:
                begin
                    ss0 = memData[3:0];
                    ss1 = memData[7:4];
                    ss2 = memData[11:8];
                    ss3 = memData[15:12];
                end
            endcase
        end
    end
endmodule
