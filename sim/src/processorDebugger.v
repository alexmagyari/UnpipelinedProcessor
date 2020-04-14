

module processorDebugger(
                         input executeButton,
                         input [9:0] switches,
                         output wire [6:0] sevenSegment0,
                         output wire [6:0] sevenSegment1,
                         output wire [6:0] sevenSegment2,
                         output wire [6:0] sevenSegment3,
                         output wire [6:0] sevenSegment4,
                         output wire [6:0] sevenSegment5,
                         input Clk,
                         input Rst);
    
    //The button value after its been shapped.
    wire buttonOut;
    //The PC Address after it has been incremented or jumped
    wire [31:0] newPCAdder;
    //The current PC Address
    wire [31:0] pcAddr;

    //The current Instruction
    wire[31:0] instruction;

    //Control Signals
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
    wire [1:0] ALUOp;

    //MUX wires
    wire [31:0] muxOutOne, muxOutTwo, muxOutFour, muxOutFive;
    wire [4:0] muxOutThree;

    //ALU and ALUControl Wires
    wire [3:0] ALUThreeControl;
    wire [31:0] ALUOutOne, ALUOutTwo, ALUOutThree;
    wire Z1, Z2, Z3; //Z1 and Z2 are ignored

    //Register wires
    wire [4:0] peekReg;
    wire [31:0] readRegData1, readRegData2, peekRegData;

    //Memory Wires
    wire [31:0] peekMemAddr, readMemData, peekMemData;

    //Sign Extend Wires
    wire [31:0] signExtendOut;

    //Seven Segment Display Wires
    wire [3:0] ssInZero, ssInOne, ssInTwo, 
            ssInThree, ssInFour, ssInFive;

    pc programCounter(muxOutTwo, pcAddr, buttonOut, Jump, Branch, Clk, Rst);
        // pc(
        //   input [31:0] in,
        //   output reg[31:0] q,
        //   input enable,
        //   input Clk,
        //   input Rst);

    instructionMemory im(pcAddr, instruction, Rst);
        // instructionMemory(
        //             input [31:0] programCounter,
        //             output reg [31:0] instruction,
        //             input Rst);

    control ctrl(instruction[31:26], RegDst, ALUSrc, MemtoReg, RegWrite,
                 MemRead, MemWrite, Branch, Jump, ALUOp);
        // control(
        //             input [5:0] instruction,
        //             output reg RegDst,
        //             output reg ALUSrc,
        //             output reg MemtoReg,
        //             output reg RegWrite,
        //             output reg MemRead,
        //             output reg MemWrite,
        //             output reg Branch,
        //             output reg Jump,
        //             output reg [1:0] ALUOp,
        //             input Clk, 
        //             input Rst);

        // All Muxes in order from the top row in the circuit
        // diagram to the bottom row, left to right
    thirtyTwoBitTwoToOneMux m1(ALUOutOne, ALUOutTwo, (Branch & Z3), muxOutOne);
    thirtyTwoBitTwoToOneMux m2(muxOutOne, {ALUOutOne[31:28], instruction[25:0], 2'b00}, Jump, muxOutTwo);
    fiveBitTwoToOneMux      m3(instruction[20:16], instruction[15:11], RegDst, muxOutThree);
    thirtyTwoBitTwoToOneMux m4(readRegData2, signExtendOut, ALUSrc, muxOutFour);
    thirtyTwoBitTwoToOneMux m5(ALUOutThree, readMemData, MemtoReg, muxOutFive);
        // thirtyTwoBitTwoToOneMux(
        //           input [31:0] A,
        //           input [31:0] B,
        //           input select,
        //           output reg [31:0] Y);
        // fiveBitTwoToOneMux(
        //           input [4:0] A,
        //           input [4:0] B,
        //           input select,
        //           output reg [4:0] Y);

    
    ALUControl ALUCtrl(instruction[5:0], ALUOp, ALUThreeControl);
        // ALUControl(
        //             input [5:0] instruction,
        //             input [1:0] ALUOp,
        //             output reg [3:0] op);

    
    registers regs(RegWrite, instruction[25:21], instruction[20:16], muxOutThree, muxOutFive, buttonOut,
                   peekReg, readRegData1, readRegData2, peekRegData, Clk, Rst);
        // registers(
        //              input regWrite,
        //              input [4:0] readReg1,
        //              input [4:0] readReg2,
        //              input [4:0] writeReg,
        //              input [31:0] writeData,
        //              input writeEnable,
        //              input [4:0] peekReg,
        //              output reg [31:0] readData1,
        //              output reg [31:0] readData2,
        //              output reg [31:0] peekData,
        //              input Clk,
        //              input Rst);

    
    dataMemory mem(ALUOutThree, readRegData2, peekMemAddr, MemWrite, MemRead, buttonOut,
                   readMemData, peekMemData, Clk, Rst);
        // dataMemory(
        //              input [31:0] addr,
        //              input [31:0] writeData,
        //              input [31:0] peekAddr,
        //              input memWrite,
        //              input memRead,
        //              input writeEnable,
        //              output reg [31:0] readData,
        //              output reg [31:0] peekData,
        //              input Clk,
        //              input Rst);


    signExtend SE(instruction[15:0], signExtendOut);
        // signExtend(
        //           input [15:0] instruction,
        //           output reg [31:0] q);

        // All three ALUs, in order of the circuit diagram from top to bottom,
        // left to right
    alu alu1(pcAddr, 32'h00000004, 4'b0010, ALUOutOne, Z1);
    alu alu2(ALUOutOne, {signExtendOut[29:0], 2'b00}, 4'b0010, ALUOutTwo, Z2);
    alu alu3(readRegData1, muxOutFour, ALUThreeControl, ALUOutThree, Z3);
        // alu(
        //           input [31:0] A,
        //           input [31:0] B,
        //           input [3:0] control,
        //           output reg [31:0] Y,
        //           output reg Zero);

    buttonShaper BS(executeButton, buttonOut, Clk, Rst);
        // buttonShaper(B, B_Out, Clk, Rst);

        // Seven segment displays
    decoder d0(ssInZero, sevenSegment0);
    decoder d1(ssInOne, sevenSegment1);
    decoder d2(ssInTwo, sevenSegment2);
    decoder d3(ssInThree, sevenSegment3);
    decoder d4(ssInFour, sevenSegment4);
    decoder d5(ssInFive, sevenSegment5);
        //  decoder (fourBit, sevenBit);

    display displayUnit(switches, peekRegData, peekMemData, muxOutTwo, ssInZero,
                        ssInOne, ssInTwo, ssInThree, ssInFour, ssInFive, peekReg, peekMemAddr, Clk, Rst);
        // display(
        //          input [9:0] switches,
        //          input [31:0] regData,
        //          input [31:0] memData,
        //          input [31:0] address,
        //          output reg [3:0] ss0,
        //          output reg [3:0] ss1,
        //          output reg [3:0] ss2,
        //          output reg [3:0] ss3,
        //          output reg [3:0] ss4,
        //          output reg [3:0] ss5,
        //          output reg [4:0] regToPeek,
        //          output reg [31:0] memToPeek,
        //          input Clk,
        //          input Rst);
endmodule