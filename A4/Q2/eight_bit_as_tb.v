`include "eight_bit_as.v"
`timescale 1ns/1ns

module eight_bit_as_tb;

// * signed lets us use numbers in 2's complement form
reg signed [7:0] a, b;
wire signed [7:0] r; // * r = a +/- b
reg opcode;
wire cout, overflow;

eight_bit_as adder_subtractor(r, cout, overflow, a, b, opcode);

initial begin
    $dumpfile("eight_bit_as_tb.vcd");
    $dumpvars(0, eight_bit_as_tb);

    $monitor("a = %d, b = %d, r = %d, opcode = %d, cout = %d, overflow = %d", a, b, r, opcode, cout, overflow);

    repeat (20) begin
        a = $random;
        b = $random;
        opcode = $random;
        #10;
    end

    $finish;
end

endmodule