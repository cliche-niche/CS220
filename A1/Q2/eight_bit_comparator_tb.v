`timescale 1ns/1ns
`include "eight_bit_comparator.v"

module eight_bit_comparator_tb;
    
reg [7:0] A, B; // * Input variables to be compared
wire GT, EQ, LT; // * Variables for Greater Than, EQuality, and Lesser Than respectively

eight_bit_comparator comparator(GT, EQ, LT, A, B); // * Instantiation

initial begin

    $dumpfile("eight_bit_comparator_tb.vcd");
    $dumpvars(0, eight_bit_comparator_tb);

    #5 A=0; B=0;
    #5 A=0; B=1;
    #5 A=1; B=0;
    #5 A=1; B=1;

    // * Random Values in the range 0-254
    repeat(12) begin
        #5;
        A = $random%255;
        B = $random%255;
    end

    // * More random values in the range 0-254 but A=B
    #10 
    repeat(4) begin
        #5;
        A = $random%255;
        B = A;
    end

    #20 $finish;
end

initial begin
    $monitor("GT=%d, EQ=%d, LT=%d, A=%d, B=%d", GT, EQ, LT, A, B);
end

endmodule