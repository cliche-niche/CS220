`include "one_bit_as.v"

module eight_bit_as (
    output [7:0] sum, output cout, overflow,
    input [7:0] a, b, input opcode
);

    // * Eight bit adder-subtractor
    // * Calculates results and carries by instantiating 8 one-bit adder-subtractors, and reports overflow (if any) using the carries

    wire [8:0] carry;

    assign carry[0] = 0;
    assign cout = carry[8];
    assign overflow = (carry[7] ^ carry[8]);

    one_bit_as as0(sum[0], carry[1], a[0], b[0], carry[0], opcode);
    one_bit_as as1(sum[1], carry[2], a[1], b[1], carry[1], opcode);
    one_bit_as as2(sum[2], carry[3], a[2], b[2], carry[2], opcode);
    one_bit_as as3(sum[3], carry[4], a[3], b[3], carry[3], opcode);
    one_bit_as as4(sum[4], carry[5], a[4], b[4], carry[4], opcode);
    one_bit_as as5(sum[5], carry[6], a[5], b[5], carry[5], opcode);
    one_bit_as as6(sum[6], carry[7], a[6], b[6], carry[6], opcode);
    one_bit_as as7(sum[7], carry[8], a[7], b[7], carry[7], opcode);
    
endmodule