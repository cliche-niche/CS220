module odd_parity #(
    parameter SIZE = 2,
    parameter S_EVEN = 2'b10, S_ODD = 2'b01 // * The two states of the FSM
) (
    output reg out,
    input inp, reset, clk
);

// ********Internal Variables*********
    reg [SIZE-1:0] state; // * State variable


// ************ CODE *****************

    initial begin
        state <= S_EVEN; // * Initial state is that we have seen no 1's (i.e., even number of 1's)
    end

    always @(posedge clk) begin
        if (reset) begin // * reset used when the input is changed and the FSM needs to be re-initialized
            state <= S_EVEN;
        end else begin
            // * Output and state are updated in a single always block
            /*  
                ? If currently, the number of 1's is-
                ? EVEN- For odd parity, output should be 1
                ? ODD- For odd parity, output should be 0
                ? */

            case (state)
                S_EVEN: if(inp) begin
                    state <= S_ODD;
                    out <= 0;
                end else begin
                    state <= S_EVEN;
                    out <= 1;
                end

                S_ODD: if(inp) begin
                    state <= S_EVEN; 
                    out <= 1;
                end else begin
                    state <= S_ODD;  
                    out <= 0;              
                end
                
                default: begin
                    state <= S_EVEN;
                end
            endcase
        end
    end
    
endmodule