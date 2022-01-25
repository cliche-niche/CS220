`timescale 1ns/1ns
`include "eight_to_three.v"

module eight_to_three_tb;
    
reg [7:0] Inp; // * Input
wire [2:0] Prio; // * Resulting priority order

eight_to_three Priority_Decoder(Prio, Inp); // * Instantiation

initial begin
    $dumpfile("eight_to_three_tb.vcd");
    $dumpvars(0, eight_to_three_tb);

    $monitor("Input=%b; Priority=%d (in decimal), %b (in binary)", Inp, Prio, Prio); // Prints Inp v/s Priority for each case

    // * 15 random inputs
    #5 Inp = 8'b00_110_101;
    #5 Inp = 8'b10_100_110;
    #5 Inp = 8'b01_010_000;
    #5 Inp = 8'b11_000_000;

    // * Random Values in the range 0-254
    repeat(7) begin
        #5 Inp = ($random)%255;
    end

    #5 Inp = 8'b10_101_000;
    #5 Inp = 8'b00_010_000;
    #5 Inp = 8'b10_000_000;
    #5 Inp = 8'b10_100_000;


    #10
    $display("Complete");
    $finish;
end

endmodule