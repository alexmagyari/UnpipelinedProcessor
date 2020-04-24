// ECE 5367
// Author: Alexander Magyari 4632
// Program Counter
// This is a test bench for the program counter
//

module pc_tb();

    reg [31:0] in;
    wire[31:0] q;
    reg enable, Jump, Branch, Clk, Rst;

    pc DUT_pc(in, q, enable, Jump, Branch, Clk, Rst);

    always 
    begin
        Clk = 1;
        #10 Clk = 0;
        #10;
    end

    initial
    begin
        Rst = 1;
        in = 32'h00000000;
        enable = 1'b0;
        Jump = 1'b0;
        Branch = 1'b0;
        #20
        Rst = 0;
        #20
        Rst = 1;
        #20
        in = 32'h00000004;
        #20;
        enable = 1'b1;
        #20 
        enable = 1'b0;
        Jump = 1'b1;
        #20
        in = 32'h000000008;
        #20 
        enable = 1'b1;
        #20
        enable = 1'b0;
        #20 
        enable = 1'b1;
        #20
        enable = 1'b0;
    end
endmodule