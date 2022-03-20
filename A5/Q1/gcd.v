`include "utils.v"

module gcd (
    output reg [7:0] G, input [7:0] A, B
);  // * Computes the GCD of two signed 8-bit numbers. The GCD is always reported positive.

    reg [7:0] a, b;     // * Local copies of A and B that will be manipulated
    reg [2:0] count;    // * Counter
    reg exc;            // * Exciter used for left shifter
    
    // * Complements of A and B respectively
    wire [7:0] CA, CB;
    complementer COMP_A(CA, A);
    complementer COMP_B(CB, B);

    // * Initializing a, b, count, exc for each input
    always @(A or B) begin
        #10;            // * Assigning absolute value of A and B to <a, b> by looking at their MSB's
        a <= (A[7] ? CA : A);
        b <= (B[7] ? CB : B);
        count = 0;  exc = 0;
    end

    // * Results of subtraction; amb := a-b, bma := 2's Complement(amb) = b-a
    wire [7:0] amb, bma;
    eight_bit_sub A_MINUS_B(amb, a, b);
    complementer B_MINUS_A(bma, amb);


    wire [7:0] res;     // * Result
    left_shifter ls(res, a, count, exc);


    always @(A or B) begin
        #15;
        if (a == 0) begin        // * Edge cases
            G <= b;
        end else if(b == 0 || a == b) begin
            G <= a;
        end else begin
            // * Non trivial case
            while ((a[0] == 1'b0) && (b[0] == 1'b0)) begin
                count++;
                a <= {1'b0, a[7:1]};        // * In-line right shifting
                b <= {1'b0, b[7:1]};
                #5;
            end

            while (a != b) begin
                if ((a[0] == 1'b0) && (b[0] == 1'b1)) begin
                    a <= {1'b0, a[7:1]};    // * In-line right shifting
                end else if ((a[0] == 1'b1) && (b[0] == 1'b0)) begin
                    b <= {1'b0, b[7:1]};    // * In-line right shifting
                end else begin
                    a <= (amb[7] ? a : b);                                  // * a <= (min(a, b));
                    b <= (amb[7] ? {1'b0, bma[7:1]} : {1'b0, amb[7:1]});    // * b <= (|a-b|>>1) = (|a-b|/2);
                end
                #25;
            end

            #5;     // * res <= (a << count);
            exc <= 1'b1;
            #5;
            exc <= 1'b0;
            G <= res;
        end
    end
    
endmodule