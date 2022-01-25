`include "two_to_four.v"

module three_to_eight (
    out,
    enab, inp
);
    // * A 3-to-8 decoder using 2 units of 2-to-4 decoders

    output [7:0] out; // * Output
    input [2:0] inp; // * Input
    input enab; // * Enabler

    // * inp[2] used in enablers of 2-to-4 decoders
    wire enab1 = enab & ~inp[2]; // * modified enabler for decoder_1
    wire enab2 = enab & inp[2];  // * modified enabler for decoder_2

    two_to_four decoder_1(out[3:0], enab1, inp[1:0]);
    two_to_four decoder_2(out[7:4], enab2, inp[1:0]);
    
endmodule