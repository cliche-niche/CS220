module trad_one_bit (
    output res, cout,
    input a, b, cin, opcode
);


    /*  *
        * res := RESult
        * cout := Carry OUT
        * a := first input
        * b := second input
        * cin := Carry IN
        */

    wire x = b ^ opcode;

    // * Boolean Expressions for res and cout
    assign res = (a ^ x ^ cin);
    assign cout = ((cin & a) | (cin & x) | (a & x));

endmodule