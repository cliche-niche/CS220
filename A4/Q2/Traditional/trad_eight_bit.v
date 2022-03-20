`include "trad_one_bit.v"

module trad_as (
    output [7:0] sum, output cout, overflow,
    input [7:0] a, b, input opcode
);

    wire [7:0] carry;

    assign cout = carry[7];
    assign overflow = (carry[7] ^ carry[6]);

    trad_one_bit as0(sum[0], carry[0], a[0], b[0], opcode, opcode);
    trad_one_bit as1(sum[1], carry[1], a[1], b[1], carry[0], opcode);
    trad_one_bit as2(sum[2], carry[2], a[2], b[2], carry[1], opcode);
    trad_one_bit as3(sum[3], carry[3], a[3], b[3], carry[2], opcode);
    trad_one_bit as4(sum[4], carry[4], a[4], b[4], carry[3], opcode);
    trad_one_bit as5(sum[5], carry[5], a[5], b[5], carry[4], opcode);
    trad_one_bit as6(sum[6], carry[6], a[6], b[6], carry[5], opcode);
    trad_one_bit as7(sum[7], carry[7], a[7], b[7], carry[6], opcode);
    
endmodule