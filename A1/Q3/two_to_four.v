module two_to_four (
    out,
    enab, inp
);

    output [3:0] out; // * Output
    input [1:0] inp; // * Input
    input enab; // * Enabler

    assign out[3] = enab & inp[1] & inp[0];
    assign out[2] = enab & inp[1] & ~inp[0];
    assign out[1] = enab & ~inp[1] & inp[0];
    assign out[0] = enab & ~inp[1] & ~inp[0];
    
endmodule