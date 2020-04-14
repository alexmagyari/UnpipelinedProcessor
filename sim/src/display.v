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
//      switches [9:0]: The ten flip switches on the board
//      regData [31:0]: The data in the selected register
//      memData [31:0] The data in the selected memory location
//      
//      
//      
// Outputs:
//      ss0: Seven Segment Display0
//      ss1: Seven Segment Display1
//      ss2: Seven Segment Display2
//      ss3: Seven Segment Display3
//      ss4: Seven Segment Display4
//      ss5: Seven Segment Display5
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
                 output reg [3:0] ss4,
                 output reg [3:0] ss5,
                 output reg [4:0] regToPeek,
                 output reg [31:0] memToPeek,
                 input Clk,
                 input Rst);

    reg [3:0] digitOnes;
    reg [3:0] digitTens;
    reg [31:0] line;

    always @(switches, regData, memData, address, Rst)
    begin
        if (Rst == 1'b0)
        begin
            ss0 = 4'b0000;
            ss1 = 4'b0000;
            ss2 = 4'b0000;
            ss3 = 4'b0000;
            ss4 = 4'b0001;
            ss5 = 4'b0000;
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
            //line = (address >> 2) + 1'b1;
            line = (address >> 2);
            digitOnes = line[3:0];
            digitTens = line[7:4];
            if (digitOnes > 4'b1001)
            begin
                digitTens = digitTens + 1'b1;
                digitOnes = digitOnes - 4'b1010;
            end
            if (digitTens > 4'b1010)
            begin
                digitTens = 4'b1001;
            end
            ss4 = digitOnes;
            ss5 = digitTens;
        end
    end
endmodule
