This is the assignment (A#5) submission from group G#36. The first question contains 3 `Verilog` files, while the rest three questions have one `MIPS` file each.
Comments have been added in each `Verilog` and `MIPS` file wherever deemed necessary.

The purpose of each file has been described briefly below-

+ <u>[Question 1:](./Q1/)</u> Implement a *GCD* calculator for two `8-bit` (signed) numbers (in `Verilog`).
  + [GCD](./Q1/gcd.v)- Calculates the GCD of two given `8-bit` (signed) numbers using `Stein's Algorithm`. Returns a positive GCD regardless of the inputs (complements/converts the inputs if they're negative).
  
  + [Utilities](./Q1/utils.v)- Contains implementations of various helper modules such as `subtractor`, `left-shifter`, `complementer`, etc.

  +[Test Bench](./Q1/tb.v)- Test bench for the GCD. Has some inputs which are intended to cover all the edge cases.

+ <u>[Question 2:](./Q2/)</u> Implement *insertion sort* (in `MIPS ISA`).
  + [Insertion Sort](./Q2/insertionSort.s)- Contains functions and loops for taking input, printing the sorted array, sorting the array, etc.

+ <u>[Question 3:](./Q3/)</u> Print *Fibonacci Numbers* upto 500 (in `MIPS ISA`).
  + [Fibonacci](./Q3/fib.s)- Loops until the Fibonacci number about to be printed exceeds 500.

+ <u>[Question 4:](./Q4/)</u> Computes the given (alternating) sum on a `float-vector` of variable size `p` (in `MIPS ISA`).
  + [Vector Sum](./Q4/vecsum.s)- Alternatingly adds and subtracts the floats from the vector while reading one input float at a time.

The instructions used to run the `verilog` files locally (on Windows 10) were-
```bash
iverilog -o ./filename.vvp ./filename.v
vvp ./filename.vvp
gtkwave.exe
```
The assembly files were simulated on QtSpim.

### Note
[Q1](./Q1/)- Assumes that the numbers are *signed* 8-bit numbers; this assumption was significant in the implementation.<br> Further, in [`gcd.v`](./Q1/gcd.v), the right-shifter implemented in [`utils.v`](./Q1/utils.v) has been replaced with in-line right shifting in favour of cleaner and more concise code.