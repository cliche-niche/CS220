This is the assignment (A#4) submission from group G#36. Both the questions contain some `verilog` files and a common report.
Comments have been added in each `verilog` file wherever deemed necessary. For the second question, I came up with a different approach, but both the traditional approach, as well as my approach have been coded and added in the report.

The *input-output* pairs in test-benches of both the questions have been printed, so the functioning can be verified from the
command line if required. Nonetheless, the results can be verified from verilog as well. <br>

The *FSM* implemented in the [first question](./Q1/) is a *Moore Machine*.

The purpose of each file has been described briefly below-

+ <u>[Question 1:](./Q1/)</u> Implement a *sequence detector* which detects the sequence *1010* in an input stream.
  + [Gray code counter](./Q1/gray_3bit.v)- Counts from 0 to 7 in the Gray system with an option to reset, and outputs *1* on the transition from S7 to S0.
  
  + [Test Bench](./Q1/gray_3bit_tb.v)- Test bench for the counter. Runs for multiple cycles initially, and is then reset to run for another cycle.

+ <u>[Question 2:](./Q2/)</u> Implement an *8-bit adder-subtractor*.
  + [1-bit Adder-Subtractor](./Q2/one_bit_as.v)- Contains the personal implementation for a *1-bit adder-subtractor*. Outputs the result, and the carry-out/ borrow. Requires two inputs bits, a carry-in/borrow-in, and an opcode (0 for addition, 1 for subtraction).

  + [8-bit Adder-Subtractor](./Q2/eight_bit_as.v)- Contains the implementation for an *8-bit adder-subtractor* by instantiating this [*1-bit adder-subtractor*](./Q2/one_bit_as.v) 8 times. Outputs the result, carry-out, and if there was any overflow. Requires two 8-bit input numbers, and an opcode (0 for addition, 1 for subtraction).

  + [Test Bench](./Q2/eight_bit_as_tb.v)- Test bench for the adder-subtractor. Contains 20 random inputs, and uses the personal implementation, but can easily be changed to test the traditional bench, by appropriately changing the include statement and module instantiation.

  + [Traditional Approach](./Q2/Traditional/)- Contains adder-subtractors implemented from the traditional approach.

+ <u>[Report:](./Report.pdf)</u> Contains a brief description about the states of the *FSM* used for the first question, its state table, excitation table, logic diagram, etc., and the algorithm used, truth tables, circuit diagrams, etc. for the *adder-subtractors* in the second question.

The instructions used to run the files locally (on Windows 10) were-
```bash
iverilog -o ./filename.vvp ./filename.v
vvp ./filename.vvp
gtkwave.exe
```

### Note
Both the approaches were included in the final submission for [Q2](./Q2/).