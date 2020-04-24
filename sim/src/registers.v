// ECE 5367
// Author: Alexander Magyari 4632
// Registers Module for an unpipelined processor
// This module will both read and write from registers
// depending on the inputs. All register values are stored
// here.
// 
// Inputs:
//      Clk: Clock
//      Rst: Reset
//      regWrite 1b: High if the data should be written to a
//                   register, low otherwise
//      readReg1 5b: Register 1 to read from
//      readReg2 5b: Register 2 to read from
//      writeReg 5b: Register to write
//      writeData 32b: The data to write to writeReg
//      writeEnable: Enable writes via push button
//      peekReg 4b: The register being viewed by the debugger
//      
// Outputs:
//      readData1 32b: The data in register 1
//      readData2 32b: The data in register 2
//      peekData 32b: The data being view by the debugger
//  

module registers(
                 input regWrite,
                 input [4:0] readReg1,
                 input [4:0] readReg2,
                 input [4:0] writeReg,
                 input [31:0] writeData,
                 input writeEnable,
                 input [4:0] peekReg,
                 output reg [31:0] readData1,
                 output reg [31:0] readData2,
                 output reg [31:0] peekData,
                 input Clk,
                 input Rst);

    reg [31:0] zero, v0, v1, a0,
               a1, a2, a3, t0,
               t1, t2, t3, t4,
               t5, t6, t7, s0,
               s1, s2, s3, s4,
               s5, s6, s7, t8,
               t9, gp, sp, fp,
               ra;

    reg State;
    parameter StateIdle = 1'b0, StateWrite = 1'b1;
    // Combinational Logic for reading registers.
    // Reading registers does not correspond to the clock,
    // only writing registers.
    always @(readReg1, readReg2, peekReg, zero, v0, v1, a0,
                                            a1, a2, a3, t0,
                                            t1, t2, t3, t4,
                                            t5, t6, t7, s0,
                                            s1, s2, s3, s4,
                                            s5, s6, s7, t8,
                                            t9, gp, sp, fp,
                                            ra)
    begin
        case(readReg1)
            5'b00000:
            begin
                readData1 = zero;
            end
            5'b00010:
            begin
                readData1 = v0;
            end
            5'b00011:
            begin
                readData1 = v1;
            end
            5'b00100:
            begin
                readData1 = a0;
            end
            5'b00101:
            begin
                readData1 = a1;
            end
            5'b00110:
            begin
                readData1 = a2;
            end
            5'b00111:
            begin
                readData1 = a3;
            end
            5'b01000:
            begin
                readData1 = t0;
            end
            5'b01001:
            begin
                readData1 = t1;
            end
            5'b01010:
            begin
                readData1 = t2;
            end
            5'b01011:
            begin
                readData1 = t3;
            end
            5'b01100:
            begin
                readData1 = t4;
            end
            5'b01101:
            begin
                readData1 = t5;
            end
            5'b01110:
            begin
                readData1 = t6;
            end
            5'b01111:
            begin
                readData1 = t7;
            end
            5'b10000:
            begin
                readData1 = s0;
            end
            5'b10001:
            begin
                readData1 = s1;
            end
            5'b10010:
            begin
                readData1 = s2;
            end
            5'b10011:
            begin
                readData1 = s3;
            end
            5'b10100:
            begin
                readData1 = s4;
            end
            5'b10101:
            begin
                readData1 = s5;
            end
            5'b10110:
            begin
                readData1 = s6;
            end
            5'b10111:
            begin
                readData1 = s7;
            end
            5'b11000:
            begin
                readData1 = t8;
            end
            5'b11001:
            begin
                readData1 = t9;
            end
            5'b11100:
            begin
                readData1 = gp;
            end
            5'b11101:
            begin
                readData1 = sp;
            end
            5'b11110:
            begin
                readData1 = fp;
            end
            5'b11111:
            begin
                readData1 = ra;
            end
            default:
            begin
                readData1 = zero;
            end
        endcase

        case(readReg2)
            5'b00000:
            begin
                readData2 = zero;
            end
            5'b00010:
            begin
                readData2 = v0;
            end
            5'b00011:
            begin
                readData2 = v1;
            end
            5'b00100:
            begin
                readData2 = a0;
            end
            5'b00101:
            begin
                readData2 = a1;
            end
            5'b00110:
            begin
                readData2 = a2;
            end
            5'b00111:
            begin
                readData2 = a3;
            end
            5'b01000:
            begin
                readData2 = t0;
            end
            5'b01001:
            begin
                readData2 = t1;
            end
            5'b01010:
            begin
                readData2 = t2;
            end
            5'b01011:
            begin
                readData2 = t3;
            end
            5'b01100:
            begin
                readData2 = t4;
            end
            5'b01101:
            begin
                readData2 = t5;
            end
            5'b01110:
            begin
                readData2 = t6;
            end
            5'b01111:
            begin
                readData2 = t7;
            end
            5'b10000:
            begin
                readData2 = s0;
            end
            5'b10001:
            begin
                readData2 = s1;
            end
            5'b10010:
            begin
                readData2 = s2;
            end
            5'b10011:
            begin
                readData2 = s3;
            end
            5'b10100:
            begin
                readData2 = s4;
            end
            5'b10101:
            begin
                readData2 = s5;
            end
            5'b10110:
            begin
                readData2 = s6;
            end
            5'b10111:
            begin
                readData2 = s7;
            end
            5'b11000:
            begin
                readData2 = t8;
            end
            5'b11001:
            begin
                readData2 = t9;
            end
            5'b11100:
            begin
                readData2 = gp;
            end
            5'b11101:
            begin
                readData2 = sp;
            end
            5'b11110:
            begin
                readData2 = fp;
            end
            5'b11111:
            begin
                readData2 = ra;
            end
            default:
            begin
                readData2 = zero;
            end
        endcase

        case(peekReg)
            5'b00000:
            begin
                peekData = zero;
            end
            5'b00010:
            begin
                peekData = v0;
            end
            5'b00011:
            begin
                peekData = v1;
            end
            5'b00100:
            begin
                peekData = a0;
            end
            5'b00101:
            begin
                peekData = a1;
            end
            5'b00110:
            begin
                peekData = a2;
            end
            5'b00111:
            begin
                peekData = a3;
            end
            5'b01000:
            begin
                peekData = t0;
            end
            5'b01001:
            begin
                peekData = t1;
            end
            5'b01010:
            begin
                peekData = t2;
            end
            5'b01011:
            begin
                peekData = t3;
            end
            5'b01100:
            begin
                peekData = t4;
            end
            5'b01101:
            begin
                peekData = t5;
            end
            5'b01110:
            begin
                peekData = t6;
            end
            5'b01111:
            begin
                peekData = t7;
            end
            5'b10000:
            begin
                peekData = s0;
            end
            5'b10001:
            begin
                peekData = s1;
            end
            5'b10010:
            begin
                peekData = s2;
            end
            5'b10011:
            begin
                peekData = s3;
            end
            5'b10100:
            begin
                peekData = s4;
            end
            5'b10101:
            begin
                peekData = s5;
            end
            5'b10110:
            begin
                peekData = s6;
            end
            5'b10111:
            begin
                peekData = s7;
            end
            5'b11000:
            begin
                peekData = t8;
            end
            5'b11001:
            begin
                peekData = t9;
            end
            5'b11100:
            begin
                peekData = gp;
            end
            5'b11101:
            begin
                peekData = sp;
            end
            5'b11110:
            begin
                peekData = fp;
            end
            5'b11111:
            begin
                peekData = ra;
            end
            default:
            begin
                peekData = zero;
            end
        endcase
    end

    // Writing registers corresponds to posedge
    // clk cycles
    always @(posedge Clk)
    begin
        if (Rst == 1'b0)
        begin
            State <= 1'b0;
            zero <= 32'h00000000;
            v0   <= 32'h00000000;
            v1   <= 32'h00000000;
            a0   <= 32'h00000000;
            a1   <= 32'h00000000;
            a2   <= 32'h00000000;
            a3   <= 32'h00000000;
            t0   <= 32'h00000000;
            t1   <= 32'h00000000;
            t2   <= 32'h00000000;
            t3   <= 32'h00000000;
            t4   <= 32'h00000000;
            t5   <= 32'h00000000;
            t6   <= 32'h00000000;
            t7   <= 32'h00000000;
            s0   <= 32'h00000000;
            s1   <= 32'h00000000;
            s2   <= 32'h00000000;
            s3   <= 32'h00000000;
            s4   <= 32'h00000000;
            s5   <= 32'h00000000;
            s6   <= 32'h00000000;
            s7   <= 32'h00000000;
            t8   <= 32'h00000000;
            t9   <= 32'h00000000;
            gp   <= 32'h00000000;
            sp   <= 32'h00000000;
            fp   <= 32'h00000000;
            ra   <= 32'h00000000;
        end
        else
        begin
            case (State)
                StateIdle:
                begin
                    if (writeEnable == 1'b1)
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
                    if (regWrite == 1'b1)
                    begin
                        case(writeReg)
                            5'b00000:
                            begin
                                //zero = writeData;
                            end
                            5'b00010:
                            begin
                                v0 <= writeData;
                            end
                            5'b00011:
                            begin
                                v1 <= writeData;
                            end
                            5'b00100:
                            begin
                                a0 <= writeData;
                            end
                            5'b00101:
                            begin
                                a1 <= writeData;
                            end
                            5'b00110:
                            begin
                                a2 <= writeData;
                            end
                            5'b00111:
                            begin
                                a3 <= writeData;
                            end
                            5'b01000:
                            begin
                                t0 <= writeData;
                            end
                            5'b01001:
                            begin
                                t1 <= writeData;
                            end
                            5'b01010:
                            begin
                                t2 <= writeData;
                            end
                            5'b01011:
                            begin
                                t3 <= writeData;
                            end
                            5'b01100:
                            begin
                                t4 <= writeData;
                            end
                            5'b01101:
                            begin
                                t5 <= writeData;
                            end
                            5'b01110:
                            begin
                                t6 <= writeData;
                            end
                            5'b01111:
                            begin
                                t7 <= writeData;
                            end
                            5'b10000:
                            begin
                                s0 <= writeData;
                            end
                            5'b10001:
                            begin
                                s1 <= writeData;
                            end
                            5'b10010:
                            begin
                                s2 <= writeData;
                            end
                            5'b10011:
                            begin
                                s3 <= writeData;
                            end
                            5'b10100:
                            begin
                                s4 <= writeData;
                            end
                            5'b10101:
                            begin
                                s5 <= writeData;
                            end
                            5'b10110:
                            begin
                                s6 <= writeData;
                            end
                            5'b10111:
                            begin
                                s7 <= writeData;
                            end
                            5'b11000:
                            begin
                                t8 <= writeData;
                            end
                            5'b11001:
                            begin
                                t9 <= writeData;
                            end
                            5'b11100:
                            begin
                                gp <= writeData;
                            end
                            5'b11101:
                            begin
                                sp <= writeData;
                            end
                            5'b11110:
                            begin
                                fp <= writeData;
                            end
                            5'b11111:
                            begin
                                ra <= writeData;
                            end
                        endcase
                    end
                    State <= StateIdle;
                end
            endcase
        end
    end
endmodule



