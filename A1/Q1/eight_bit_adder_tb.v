`timescale 1ns / 1ns
`include "eight_bit_adder.v"

module eight_bit_adder_tb;

reg [7:0] A, B; // * Input variables
wire [7:0] R; // * Result of adding the two input variables
reg C_in;
wire C_out; // * Carry in, and Carry out respectively

eight_bit_adder adder(R, C_out, A, B, C_in);

initial begin
    
    $dumpfile("eight_bit_adder_tb.vcd");
    $dumpvars(0, eight_bit_adder_tb);

    C_in=0;
    #1;

    // * Random values in the range 0-255
    repeat(20) begin
        A = ($random) % 256;
        B = ($random) % 256;
        #5;
    end

    $display("Complete.");

    #20 $finish;
end

initial begin
    $monitor("A=%d, B=%d, A+B=%d, Carry Out=%b", A, B, R, C_out);
end

endmodule