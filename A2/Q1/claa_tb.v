`timescale 1ns/1ns
`include "claa.v"

module claa_tb; // * Test bench for the 8-bit CLAA (Carry Look-Ahead Adder)

    reg [7:0] A, B; // * Two numbers to be added A, and B
    wire [7:0] R; // * and their result R = A + B
    wire C_in, C_out; // * Carry In, initialized to 0 and Carry Out
    assign C_in = 0;

    claa adder(R, C_out, A, B, C_in);

    initial begin

        $dumpfile("claa_tb.vcd");
        $dumpvars(0, claa_tb);
        
        repeat(20) begin
            A = $random;
            B = $random;
            #5;
        end

    end

    initial begin
        $monitor("A=%d, B=%d, R=%d, Cout=%d", A, B, R, C_out);
    end

endmodule