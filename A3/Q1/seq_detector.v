module seq_detector #(
    parameter SIZE = 5,
    parameter S_DEF = 5'b10000, S_1XXX = 5'b00001, S_10XX = 5'b00010, S_101X = 5'b00100, S_1010 = 5'b01000
) (
    output reg out,
    input inp, reset, clk
);
// * Sequence detector that detects occurence of the subsequence 1010 in an 8-bit sequence
// * Reads a single bit of the input and updates the corresponding output bit at any moment

// *********Internal Variables************
    reg [SIZE-1:0] state, next_state;


// ****************CODE*******************

    // * Initial condition
    initial begin
        state <= S_DEF;
    end

    // * Resetting the state for when a new 8-bit sequence is being read
    always @(reset) begin
        state <= S_DEF;
    end

    // * Deciding the next state of the FSM based on the current state
    always @(posedge clk) begin
        case (state)
            S_DEF: if(inp) begin
                next_state <= S_1XXX;
            end else begin
                next_state <= S_DEF;
            end

            S_1XXX: if(inp) begin
                next_state <= S_1XXX;
            end else begin
                next_state <= S_10XX;
            end

            S_10XX: if(inp) begin
                next_state <= S_101X;
            end else begin
                next_state <= S_DEF;
            end

            S_101X: if(inp) begin
                next_state <= S_1XXX;
            end else begin
                next_state <= S_1010;
            end

            S_1010: if(inp) begin
                next_state <= S_101X;
            end else begin
                next_state <= S_DEF;
            end

            default: 
                next_state <= S_DEF;
        endcase
    end

    // *********OUTPUT*********
    always @(state) begin
        case (state)
            S_1010: begin
                out <= 1;
            end
            default: 
                out <= 0;
        endcase
    end

    // * Updating the current state
    always @(next_state) begin
        state <= next_state;
    end

endmodule