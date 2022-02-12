`timescale 1ns/1ns

module johnson_rc (
    output reg [7:0] q,
    input clk, init, input [7:0] inp
);

    always @(posedge clk) begin
        if (init) begin
            q <= inp;
        end
        else begin
            q <= {~q[0], q[7:1]};
        end
    end
    
endmodule