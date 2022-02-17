module odd_parity #(
    parameter SIZE = 5,
    parameter E_0_DEF = 5'b10000, E_1 = 5'b00001, O_1 = 5'b00010, E_2 = 5'b00100, O_2 = 5'b01000
) (
    output reg out,
    input inp, reset, clk
);

// ********Internal Variables*********
    reg [SIZE-1:0] state, next_state;


// ************ CODE *****************
    initial begin
        state <= E_0_DEF;
    end

    always @(reset) begin
        state <= E_0_DEF;
    end

    always @(posedge clk) begin
        case (state)
            E_0_DEF: if(inp) begin
                next_state <= O_1;
            end else begin
                next_state <= E_1;
            end

            E_1: if(inp) begin
                next_state <= O_2;                
            end else begin
                next_state <= E_2;                
            end

            O_1: if(inp) begin
                next_state <= E_2;
            end else begin
                next_state <= O_2;                
            end

            E_2: if(inp) begin
                next_state <= E_0_DEF;
                out <= 0;
            end else begin
                next_state <= E_0_DEF;
                out <= 1;
            end
            
            O_2: if(inp) begin
                next_state <= E_0_DEF;
                out <= 1;
            end else begin
                next_state <= E_0_DEF;
                out <= 0;
            end
            
            default: begin
                next_state <= E_0_DEF;
            end
        endcase
    end

    always @(next_state) begin
        state <= next_state;
    end
    
endmodule