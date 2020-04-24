// ECE 5367
// Author: Alexander Magyari 4632
// Program Counter
// This is a clocked program counter for a processor
// with an enable bit for to load the new pc in.
// 
// Inputs:
//   in 32b: Address to access
//   enable: Loads the new pc value in when high
//   jump: if current command is a jump
//   branch if current command is a branch
//   Clk
//   Rst
//
// Outputs:
//   q 32b: outputs address

module pc(
          input [31:0] in,
          output reg[31:0] q,
          input enable,
          input Jump,
          input Branch,
          input Clk,
          input Rst);
    reg State;
    parameter StateIdle = 1'b0, StateCheckJumpOrBranch = 1'b1;
    always @(posedge Clk)
    if (Rst == 1'b0)
    begin
        State <= StateIdle;
        q <= 32'h00000000;
    end
    else
    begin
        case (State)
            StateIdle:
            begin
                if (enable == 1)
                begin
                    q <= in;
                    State <= StateCheckJumpOrBranch;
                end
                else
                begin
                    State <= StateIdle;
                end
            end
            //Jumps and Branches are loaded into the 'in' instead of executing
            //on a button press, and therefore the address must be reloaded on the 
            //next clock cycle
            StateCheckJumpOrBranch:
            begin
                if ((Jump == 1) || (Branch == 1))
                begin
                    if (enable == 1)
                    begin
                        q <= in;
                        State <= StateIdle;
                    end
                    else
                    begin
                        State <= StateCheckJumpOrBranch;
                    end
                end
                else
                begin
                    State <= StateIdle;
                end
            end
        endcase
    end
endmodule

