`timescale 1ns/1ns
`include "seq_detector.v"

module seq_det_tb;


reg [7:0] inp = 8'b01101010;
reg [7:0] out;
reg i; 
wire o;

seq_detector seq(o, i, reset, clk);

integer index;

reg clk = 0;
reg reset = 0;

always begin
    #5 clk = ~clk;
end

always begin
    #100 reset = ~reset; 
    // * Resets after each 100 time quanta
    // * It takes roughly 80 time quanta to finish reading an 8-bit input,
    // * the extra 20 time quanta are only precautionary
end

always @(inp) begin // * Writes output whenever input is changed
    for (index = 8; index; index--) begin
        i <= inp[index-1]; // * Reading input one bit at a time
        #10;
        out[index-1] <= o; // * Writing output one bit at a time
    end
end

initial begin

    $dumpfile("seq_det_tb.vcd");
    $dumpvars(0, seq_det_tb);

    #101;
    inp = 8'b10001010;

    #100;
    inp = 8'b10101010;

    #100;
    inp = 8'b01010101;

    #100;
    inp = 8'b10010101;

    #100;
    inp = 8'b10100110;

    #100;
    inp = 8'b01010100;

    #100;
    inp = 8'b11000110;

    #100;
    inp = 8'b10101001;

    #100;
    inp = 8'b00101011;

    #100;
    inp = 8'b11101000;

    #100;
    inp = 8'b00101001;

    #100;
    inp = 8'b11001100;

    #100;
    inp = 8'b11000110;

    #100;
    inp = 8'b10101010;

    #100;
    inp = 8'b10011010;

    #100;
    inp = 8'b10100110;

    #100;
    inp = 8'b10010100;

    #100;
    inp = 8'b11010000;

    #100;
    inp = 8'b01011000;

    #100;
    inp = 8'b10101011;

    #100;
    inp = 8'b01101011;

    #100;
    inp = 8'b11010100;

    #100;
    inp = 8'b10011101;

    #100 $finish;
end

always @(reset) begin
    $display("input = %b, output = %b", inp, out);
end


endmodule