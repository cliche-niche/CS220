`timescale 1ns/1ns
`include "three_to_eight.v"

module three_to_eight_tb;
    
reg [2:0] Inp;
wire E = 1; // * Enabler is put to 1 by default
wire [7:0] Out;

three_to_eight decoder(Out, E, Inp);

initial begin
    $dumpfile("three_to_eight_tb.vcd");
    $dumpvars(0, three_to_eight_tb);

    // * All 8 possible inputs 
    #5 Inp = 0;
    repeat(7) begin
        #5 Inp++;
    end

    #20 $finish;
end

initial begin
    $monitor("Input=%b (In binary), %d (In decimal); Output=%b (In binary)", Inp, Inp, Out);
    // Prints the values of Input and Output for each case
end

endmodule