module gray_3bit #(
    parameter SIZE = 3,
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b011, S3 = 3'b010,
    parameter S4 = 3'b110, S5 = 3'b111, S6 = 3'b101, S7 = 3'b100
) (
    output reg out, output [SIZE-1:0] m_state, 
    input clk, reset
);
    
// **********Internal Variables***********
    reg [SIZE-1:0] state;

// ****************Code*******************

    // * Initializing at S0 (000)
    initial begin
        state <= S0;
    end

    assign m_state = state; // * (Main_State) m_state Wire that is always assigned the internal state of the FSM
    // * So that it may be accessed in the test bench if required

    always @(posedge clk) begin
        if (reset) begin
            state <= S0; // * Reset if needed
        end else begin
            case (state) // * Transitions
                S0 : state <= S1;
                S1 : state <= S2;
                S2 : state <= S3;
                S3 : state <= S4;
                S4 : state <= S5;
                S5 : state <= S6;
                S6 : state <= S7;
                S7 : state <= S0;
                default: state <= S0;
            endcase
        end
    end

    // * Code for output
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end else begin
            if (state == S7) begin
                out <= 1;
            end else begin
                out <= 0;
            end
        end
    end


endmodule