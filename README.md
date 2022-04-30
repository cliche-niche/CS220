This repository contains the programming assignments we had to submit in the course [CS220: Computer Organisation](https://www.cse.iitk.ac.in/pages/CS220.html) (2021-22 II Sem.) in a team of three.<br> 
The languages used in assignments were majorly `Verilog` and `Assembly` ([MIPS ISA](https://en.wikipedia.org/wiki/MIPS_architecture)).

The repository doesn't contain `.vvp` and `.vcd` files but can be generated by running the commands written [here](Instructions.md) in the directory that contains the corresponding `.v` file.<br>

## Directories

+ <u>[Hello](./Hello/)</u> Contains some basic "Hello World" programs (in Verilog and MIPS). Verilog can be run with iVerilog and MIPS with QtSpim. For help, consider [Instructions](./Instructions.md).
+ <u>[Assignment 1:](./A1/)</u> Implement an `8-bit adder`, `8-bit comparator`, `3-to-8 decoder`, and an `8-to-3 priority encoder`.
+ <u>[Assignment 2:](./A2/)</u> Implement an `8-bit carry look-ahead adder`, and an `8-bit Johnson Counter`.
+ <u>[Assignment 3:](./A3/)</u> Implement a `(1010) Sequence Detector`, and a `3-bit Odd Parity Generator` in the form of an `FSM`.
+ <u>[Assignment 4:](./A4/)</u> Implement a `3-bit Gray code counter` in the form of an `FSM`, and an `8-bit adder/subtractor`.
+ <u>[Assignment 5:](./A5/)</u> Implement a `GCD calculator` [Stein's Algorithm](https://en.wikipedia.org/wiki/Binary_GCD_algorithm) in `Verilog`, and write code for `Insertion Sort`, generating `Fibonacci Numbers`, and `alternatively adding/subtracting` floats in a vector of size `p` in `MIPS`.
+ <u>[Quiz 3:](./Q3/)</u> Contains my submissions in Quiz 3. MIPS programs to find `quotient` and `remainder`, `slope` of a line, and `binary search`. The submission for the binary search does not work properly in the case when the key is present in the array.

### Remarks
+ [Assignment 2](./A2/): 5 marks deducted in the Report because truth table of Johnson counter not included (perks of having groupmates)
+ [Assignment 3](./A3/): 5 marks deducted in the Second Question, no feedback provided.
+ [Assignment 4](./A4/): 5 marks deducted, no feedback provided.
+ [Quiz 3](./Q3/Q3.s): 20 marks deducted, since binary search did not work properly.
+ You may refer to [instructions](./Instructions.md) for running verilog codes or MIPS programs.
+ You may use [this](./MIPS.md) as a glossary or for some common commands in MIPS.
+ There was another assignment/ lab session, where we were made to burn an FPGA board to implement a `1-bit Full Adder` and a `2-to-1 MUX`. Unfortunately, I cannot provide the codes used directly. However, we used [this](https://github.com/FrankBuss/YaGraphCon/blob/master/spartan3e/src/spartan3e.ucf) for the constraint file.
+ Most of the students either did not use LaTeX for assignment reports, or imported hand-drawn diagrams. I sticked to LaTeX despite disapproval and/or lack of support. The package used to draw the circuits is `circuitikz` and `karnaugh-map` for K-maps.