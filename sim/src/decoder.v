// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Decoder Module
// This module decodes a 4 bit signal for output on a 
// seven segment display with negative logic for the 
// individual LEDs on the display. Decodes for 0-F
// 
// Inputs:
//   fourBit: four bit signal to be displayed
//
// Outputs:
//   sevenBit: seven bit signal to be sent to seven
//             segment display. Output is shown as:
//             0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, b, 
//             c, d, E, F

module decoder (fourBit, sevenBit);
    input [3:0] fourBit;
    output [6:0] sevenBit;
    reg [6:0] sevenBit;

    always @ (fourBit)
        begin
            case(fourBit)
                4'b0000:
                    begin
                        sevenBit = 7'b1000000;
                    end
                4'b0001:
                    begin
                        sevenBit = 7'b1111001;
                    end
                4'b0010:
                    begin
                        sevenBit = 7'b0100100;
                    end
                4'b0011:
                    begin
                        sevenBit = 7'b0110000;
                    end
                4'b0100:
                    begin
                        sevenBit = 7'b0011001;
                    end
                4'b0101:
                    begin
                        sevenBit = 7'b0010010;
                    end
                4'b0110:
                    begin
                        sevenBit = 7'b0000010;
                    end
                4'b0111:
                    begin
                        sevenBit = 7'b1111000;
                    end
                4'b1000:
                    begin
                        sevenBit = 7'b0000000;
                    end
                4'b1001:
                    begin
                        sevenBit = 7'b0011000;
                    end
                4'b1010:
                    begin
                        sevenBit = 7'b0001000;
                    end
                4'b1011:
                    begin
                        sevenBit = 7'b0000011;
                    end
                4'b1100:
                    begin
                        sevenBit = 7'b0100111;
                    end
                4'b1101:
                    begin
                        sevenBit = 7'b0100001;
                    end
                4'b1110:
                    begin
                        sevenBit = 7'b0000110;
                    end
                4'b1111:
                    begin
                        sevenBit = 7'b0001110;
                    end
            endcase
        end
endmodule
            
