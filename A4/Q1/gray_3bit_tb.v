`include "gray_3bit.v"
`timescale 1ns/1ns

module gray_3bit_tb;

reg clk=0, reset=0;
wire out;
wire [2:0] state;

gray_3bit gray(out, state, clk, reset);

always begin
    #5 clk = ~clk;
end

initial begin
    $dumpfile("gray_3bit_tb.vcd");
    $dumpvars(0, gray_3bit_tb);

    $monitor("Present State = %b, Output = %b, Reset = %b", state, out, reset);

    // * Simple testing of the FSM
    #300;
    reset = 1;
    #10;
    reset = 0;
    
    #70;
    reset = 1; // * Resets the FSM back to state S0
    #10;
    reset = 0;

    #100 $finish;
end
    
endmodule