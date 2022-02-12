module four_bit_claa (
    output [3:0] res, output cout,
    input [3:0] a, b, input cin
);
    // * Combining four bits together in this implementation.

    wire [3:0] p, g; // * Propagate and Generate arrays
    
    // * Component wise assignment
    assign p = a | b; // * OR for Propagation (generally faster than XOR)
    assign g = a & b; // * AND for Generation

    wire [4:0] c; // * Carries
    
    // * Expanding the expression- `C[i+1] = G[i] | (P[i] & C[i])`
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

    assign cout = c[4];

    assign res = a ^ b ^ c[3:0]; // * Component wise assignment

endmodule