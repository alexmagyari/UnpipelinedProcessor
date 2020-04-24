// ECE 5367
// Author: Alexander Magyari 4632
// Converts hex to two digit BCD for display
// This module outputs a maximum of 99 in decimal
// and relies on binary input. IE Binary Coded Decimal
// 
// Inputs:
//      hex [7:0]: The inputted hex number
//      
//      
//      
// Outputs:
//      d1 [3:0]: Decimal ones place
//      d10 [3:0]: Decimal Tens place

module BCD(
                 input [7:0] hex,
                 output reg [3:0] d1,
                 output reg [3:0] d10);

    reg [7:0] hexT;
    integer i;

    always@(hex)
    begin
        hexT = hex[7:5];
        for (i = 0; i < 5; i = i + 1)
        begin
            if (hexT[3:0] > 4)
            begin
                hexT = hexT + 3;
            end
            hexT = {hexT[6:0], hex[4 - i]};
        end
        d1 = hexT[3:0];
        d10 = hexT[7:4];
    end
endmodule