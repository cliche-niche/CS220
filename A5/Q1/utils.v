module one_bit_sub (
    output res, cout,
    input a, b, cin
);  // * Dedicated one bit subtractor
    assign res = (a ^ (~b) ^ cin);     // * Boolean Expressions for res and cout
    assign cout = ((cin & a) | (cin & (~b)) | (a & (~b)));
endmodule

module eight_bit_sub (
    output [7:0] res,
    input [7:0] a, b
);  // * Dedicated eight bit subtractor; res = a - b;
    wire [7:0] carry;

    one_bit_sub as0(res[0], carry[0], a[0], b[0], 1'b1);
    one_bit_sub as1(res[1], carry[1], a[1], b[1], carry[0]);
    one_bit_sub as2(res[2], carry[2], a[2], b[2], carry[1]);
    one_bit_sub as3(res[3], carry[3], a[3], b[3], carry[2]);
    one_bit_sub as4(res[4], carry[4], a[4], b[4], carry[3]);
    one_bit_sub as5(res[5], carry[5], a[5], b[5], carry[4]);
    one_bit_sub as6(res[6], carry[6], a[6], b[6], carry[5]);
    one_bit_sub as7(res[7], carry[7], a[7], b[7], carry[6]);
endmodule

module right_shifter (
    output reg [7:0] out,
    input [7:0] inp, input exc
);  // * Right-shifter which shifts one-bit on being excited
    //  ***Has been replaced by in-line right shifting to reduce number of (excitation) variables used in GCD***
    //  * Also in favour of cleaner code *
    always @(posedge exc) begin
        out <= {1'b0, inp[7:1]};    
    end
endmodule

module left_shifter (
    output reg [7:0] out, 
    input [7:0] inp, input [2:0] shamt, input exc
);  // * Left-shifter which shifts input "shamt" bits at once on being excited
    integer i = 0;
    always @(posedge exc) begin
        for (i = 0; i < shamt; i++) begin
            out[i] <= 0;
        end
        for (i = shamt; i < 8; i++) begin
            out[i] <= inp[i-shamt];
        end
    end
endmodule

module complementer (
    output [7:0] a_comp,
    input [7:0] a
);  // * a-comp = 2's complement of A := 0 - a
    eight_bit_sub complement(a_comp, 8'b0, a);
endmodule