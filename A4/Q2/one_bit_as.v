module one_bit_as (
    output sum, carry,
    input a, b, cin, opcode
);
    /*  *
        *   One bit adder-subtractor
        *   Output: sum is the result of the operation, 
        *           carry is the carry out for/ borrow to be taken from the more significant bit
        *   Input:  a, b are the operands (a+b or a-b), cin is the carry in from/ borrow for the less significant bit,
        *           opcode is the code for operation to be done, 0 for addition, 1 for subtraction
    */

    assign sum = a ^ b ^ cin; // * Irrespective of opcode

    assign carry = (b & cin) | ((opcode ^ a) & b) | ((opcode ^ a) & cin);
    /* 
        *   Equivalently, let cin=c, opcode=o for shorthand, then,we can write
        *   carry = (o & ((~a & (b | c)) | (a & b & c))) | (~o & ((a & b) | (b & c) | (c & a)))
        ?   We use the simplification,   (a & b & c) | (~a & (b | c)) = (~a & b) | (~a & c) | (b & c)
        *   carry = (o & ((~a & b) | (~a & c) | (b & c))) | (~o & ((a & b) | (b & c) | (c & a)))
        ?   Further, we make this simplification (resulting from an observation),
        ?   carry = (b & c) | ((o ^ a) & b) | ((o ^ a) & c)
        ?   carry = (b & c) | ((o ^ a) & (b | c))
        *   All of these simplifications have been explained in the document
    */

endmodule