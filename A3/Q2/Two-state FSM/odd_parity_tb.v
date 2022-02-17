`timescale 1ns/1ns
`include "odd_parity.v"

module odd_parity_tb;

reg [2:0] inp; // * 3 bit input/ message
wire out; // * Output bit; Always active but only the output after the third bit is relevant (i.e., the last output)
reg in; // * The input stream is read one bit at a time by virtue of this variable

reg clk = 0;
reg reset = 0;

integer index = 3; // * For iterating through the 3-bit input

odd_parity gen(out, in, reset, clk); // * Instantiation of the odd parity generator


always begin
    #5 clk = ~clk;
end


initial begin

    // * Some delay in the output wrt input
    $dumpfile("odd_parity_tb.vcd");
    $dumpvars(0, odd_parity_tb);

    /*
        ! Prints the input and output at each intermediate change but please 
        ! note that only the final output corresponding to an input is relevant.

        ! This is because only two states are used 
        ! and we need to generate outputs too.

        ! An alternate approach with an FSM with 5 possible states
        ! is a possible work-around this problem, in which the output
        ! is changed/ provided only after reading the third bit.
    */
    $monitor("input = %b, output = %b", inp, out);

    inp = 3'b111;
    reset = 1;
    
    repeat(8) begin // * Sequential input from 0-7
        reset = 1; // * FSM is reset prior to reading a new input stream
        inp++;
        #10;
        reset = 0;
        #30;
    end

    repeat (9) begin // * Random instances of input from 0-7
        reset = 1; // * FSM is reset prior to reading a new input stream
        inp = $random;
        #10;
        reset = 0;
        #30;
    end

    $finish;
end

always @(negedge clk) begin
    if (reset) begin
        // * Resetting the input bit and the index
        in <= 0;
        index = 3;
    end else begin
        // * Reading the input
        in <= inp [index-1];
        index <= index - 1;
    end
end

endmodule