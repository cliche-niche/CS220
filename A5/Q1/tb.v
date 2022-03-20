`timescale 1ns/1ns
`include "gcd.v"

module tb;
    reg signed [7:0] A, B;
    wire signed [7:0] G;
    reg clk=0;

    gcd GCD(G, A, B); // * Module instantiation

    always @(edge clk) begin
        $display("A=%d,\tB=%d,\tGCD=%d", A, B, G);
    end

    always begin
        #500;
        clk = ~clk;
    end

    initial begin

        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        #5;
        A = 0;
        repeat(3) begin
            B = $random;
            #500;
        end

        repeat(3) begin
            A = $random;
            B = A;
            #500;
        end

        // * Some examples
        A = 60; B = 100; #500;
        A = 64; B = 96; #500;
        A = 63; B = 54; #500;
        A = 42; B = 81; #500;
        A = 42; B = 96; #500;
        A = -92; B = 69; #500;
        A = -32; B = -128; #500;
        A = 64; B = -128; #500;
        A = 6; B = 108; #500;
        A = 17; B = 37; #500;
        A = 57; B = 107; #500;
        A = 68; B = 24; #500;
        A = 119; B = 1; #500;

        $finish;
    end
endmodule