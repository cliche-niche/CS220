module eight_to_three (
    prio,
    inp
);

    output [2:0] prio; // * Priority order is the output
    input [7:0] inp; // * Input is a 8-bit long vector

    /*  * 
        * Simplified Boolean Expressions for each 
        * bit in the output using Karnaugh Maps */

    assign prio[2] = (~(inp[0] | inp[1] | inp[2] | inp[3]));
    assign prio[1] = (~inp[0]) & (~inp[1]) & (inp[2] | ((~inp[2]) & (inp[3] | ((~inp[4]) & (~inp[5])))));
    assign prio[0] = (~inp[0]) & (inp[1] | ((~inp[1]) & (~inp[2]) & (inp[3] | ((~inp[4]) & (inp[5] | ((~inp[5]) & (~inp[6])))))));
    
    // Default priority is 7/111
    // i.e., for input 00000000, priority is decoded to 7
    // (Due to assumptions for don't care terms in K-Map)

endmodule