module one_bit_full_adder (
    output res, cout,
    input a, b, cin
);


    /*  *
        * res := RESult
        * cout := Carry OUT
        * a := first input
        * b := second input
        * cin := Carry IN
        */

    wire na, nb, ncin; // * Complementary variables (nots) for a, b, cin
    assign na = ~a;
    assign nb = ~b;
    assign ncin = ~cin;

    // * Boolean Expressions for res and cout
    assign res = ((cin & na & nb) | (ncin & a & nb) | (ncin & na & b) | (cin & a & b));
    assign cout = ((cin & a) | (cin & b) | (a & b));

endmodule