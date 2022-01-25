`include "one_bit_comparator.v"

module eight_bit_comparator (
    gt, eq, lt,
    a, b
);
    
    output gt, eq, lt; // * Output wires
    input [7:0] a, b; // * Input variables to be compared
    wire [7:0] gi, ei, li; // * Intermediate variables to consider more significant bits

    assign gi[7] = 0, ei[7] = 1, li[7] = 0; // * Initialization before first comparison


    // * Comparing bits one-by-one, starting from the MSB downto the LSB
    one_bit_comparator compMSB(gi[6], ei[6], li[6], a[7], b[7], gi[7], ei[7], li[7]);
    one_bit_comparator comp6(gi[5], ei[5], li[5], a[6], b[6], gi[6], ei[6], li[6]);
    one_bit_comparator comp5(gi[4], ei[4], li[4], a[5], b[5], gi[5], ei[5], li[5]);
    one_bit_comparator comp4(gi[3], ei[3], li[3], a[4], b[4], gi[4], ei[4], li[4]);
    one_bit_comparator comp3(gi[2], ei[2], li[2], a[3], b[3], gi[3], ei[3], li[3]);
    one_bit_comparator comp2(gi[1], ei[1], li[1], a[2], b[2], gi[2], ei[2], li[2]);
    one_bit_comparator comp1(gi[0], ei[0], li[0], a[1], b[1], gi[1], ei[1], li[1]);
    one_bit_comparator compLSB(gt, eq, lt, a[0], b[0], gi[0], ei[0], li[0]);

endmodule