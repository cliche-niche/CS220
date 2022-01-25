module one_bit_comparator (
    gt, eq, lt,
    a, b, gi, ei, li
);
    
    output gt, eq, lt; // * Output: Greater Than (a>b), EQuality (a=b), Lesser Than (a<b)
    input a, b; // * Input to be compared
    input gi, ei, li; // * Additional Input to be used for consideration of more significant bits/ bits on the left of current bit


    // * Either a>b from more significant bits, or a=b from more significant bits and for the current bit, a=1 and b=0
    assign gt = (gi | ((a & ~b) & ei)); 
    
    // * a=b in more significant bits and for the current bit, a=b
    assign eq = (ei & (a == b));
    
    // * Either a<b from more significant bits, or a=b from more significant bits and for the current bit, a=0 and b=1
    assign lt = (li | ((~a & b) & ei));

endmodule