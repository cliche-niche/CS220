`include "one_bit_full_adder.v"

module eight_bit_adder (
    res, cout,
    a, b, cin
);

    input [7:0] a, b; // * First input, Second input
    output [7:0] res; // * Result
    wire [6:0] carry; // * Vector of carries
    input cin; // * Carry in
    output cout; // * Carry out

    // * Instantiation of one bit adders
    one_bit_full_adder adder0(res[0], carry[0], a[0], b[0], cin);
    one_bit_full_adder adder1(res[1], carry[1], a[1], b[1], carry[0]);
    one_bit_full_adder adder2(res[2], carry[2], a[2], b[2], carry[1]);
    one_bit_full_adder adder3(res[3], carry[3], a[3], b[3], carry[2]);
    one_bit_full_adder adder4(res[4], carry[4], a[4], b[4], carry[3]);
    one_bit_full_adder adder5(res[5], carry[5], a[5], b[5], carry[4]);
    one_bit_full_adder adder6(res[6], carry[6], a[6], b[6], carry[5]);
    one_bit_full_adder adder7(res[7], cout, a[7], b[7], carry[6]);
    
endmodule