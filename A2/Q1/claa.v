`include "four_bit_claa.v"

module claa (
    output [7:0] res, output cout,
    input [7:0] a, b, input cin
);
    // * 8-bit Carry Look-Ahead Adder (8-bit CLAA)

    wire cint; // * Intermediate carry

    four_bit_claa adder0(res[3:0], cint, a[3:0], b[3:0], cin);
    four_bit_claa adder1(res[7:4], cout, a[7:4], b[7:4], cint);
    
endmodule