`timescale 1ns/1ns
`include "johnson_rc.v"

module jrc_tb;
    
    wire [7:0] q;
    reg clk, init;
    reg [7:0] inp;

    johnson_rc jrc(q, clk, init, inp);

    always begin
        #5 clk = ~clk;
    end

    initial begin

        $dumpfile("jrc_tb.vcd");
        $dumpvars(0, jrc_tb);
        
        clk = 0;
        inp = 0;
        init = 1;
        #10;

        init = 0;
        #165;

        // init = 1;
        // repeat (5) begin
        //     inp = $random;
        //     #165;
        // end

        $finish;
    end

    initial begin
        $monitor("q = %b, clk=%b, inp=%b", q, clk, inp);
    end

endmodule