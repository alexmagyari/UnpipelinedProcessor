// ECE 5440/6370 
// Author: Alexander Magyari 4632
// Button Shaper Module
// Two procedure finite state machine implementation for button press
// Implements positive logic for button press, and output goes high
// for exactly one full clock cycle upon button press.
//
// Inputs: 
//      B: button in
//      Clk: Clock
//      Rst: Reset; When high, machine stops and goes to first state
//
// Outputs:
//      B_Out: Output signal for button press.


module buttonShaper(B, B_Out, Clk, Rst);

    input B;
    output B_Out;
    reg B_Out;
    input Clk, Rst;

    parameter State_Off = 0, State_On1 = 1,
            State_On2 = 2, State_On3 = 3;

    reg [1:0] State, StateNext;

    //Comb Logic
    always @ (State, B)
    begin
        case (State)
            State_Off:
            begin
                B_Out = 0;
                if (B == 1)
                begin
                    StateNext = State_Off;
                end
                else
                begin
                    StateNext = State_On1;
                end
            end
            State_On1:
            begin
                B_Out = 1;
                StateNext = State_On2;
            end
            State_On2:
            begin
                B_Out = 0;
                if (B == 0)
                begin
                    StateNext = State_On2;
                end
                else
                begin
                    StateNext = State_Off;
                end
            end
            default:
            begin
                B_Out = 0;
                StateNext = State_Off;
            end
        endcase
    end

    always @ (posedge Clk) 
    begin
        if (Rst == 0)
        begin
            State = State_Off;
        end
        else
        begin
            State = StateNext;
        end
    end
endmodule
    