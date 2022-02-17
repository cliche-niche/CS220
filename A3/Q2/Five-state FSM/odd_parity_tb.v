`timescale 1ns/1ns
`include "odd_parity.v"

module seq_det_tb;

reg [2:0] inp;
wire out;
reg i;

odd_parity gen(out, i, reset, clk);

integer index;

reg clk = 0;
reg reset = 0;

always begin
    #5 clk = ~clk;
end

always begin
    #50 reset = ~reset; 
    // * Resets after each 50 time quanta
    // * It takes roughly 30 time quanta to finish reading an 8-bit input,
    // * the extra 20 time quanta are only precautionary
end

always @(reset) begin // * Writes output whenever input is changed
    for (index = 3; index; index--) begin
        i <= inp[index-1]; // * Reading input one bit at a time
        #10;
    end
end

initial begin

    $dumpfile("seq_det_tb.vcd");
    $dumpvars(0, seq_det_tb);

    $monitor("input = %b, output = %b", inp, out);

    inp = 0;
    #49;

    repeat(7) begin
        #50;
        inp++;
    end

    repeat (8) begin
        #50;
        inp = $random;
    end

    #500 $finish;
end


endmodule