This is the submission for Assignment#2 from group G36. Question 1 contains three `verilog` files and Question 2 contains two verilog files. Comments have been added in each `verilog` file wherever deemed necessary. A `pdf` file containing the detailed description about both the questions has also been included.

Further, a `$monitor` statement has been used in all the *test benches* so that the results can be verified from the command line itself. Nonetheless, `gtkwave` can still be used to inspect and verify correct functioning, and the output can be avoided simply by commenting out the line which contains `$monitor`. Some *test benches* also make use of the inbuilt function `$random` to generate unknown testcases.

The purpose of each file has been described briefly below-

+ <u>Question 1:</u> Implement an *eight-bit carry look-ahead adder*.

  + [Four-Bit CLAA](A2Q1_four_bit_claa.v): CLAA is the acronymn for Carry Look-Ahead Adder. Module that takes two 4-Bit numbers and outputs the result, along with the resultant carry out.

  + [Eight-Bit CLAA](A2Q1_claa.v): Instantiates 2 *four bit claa* to add 2 *eight bit* numbers, with a given initial carry in, and outputs their result, along with the resultant carry out. It does not return each intermediate carry but the code can easily be changed to accommodate for it.

  + [Test Bench](A2Q1_claa_tb.v): Top level module which instantiates an *eight bit claa* to add two numbers *A* and *B*, resulting in *R*. The initial carry is assumed to be 0, but can be changed if required. Apart from the result *R*, it also returns the final carry *(C<sub>out</sub>)*. *20* random values have been generated in the range *0-255* using an inbuilt function `$random`. These serve as our test cases.

+ <u>Question 2:</u> Implement an *eight-bit johnson ring counter*.

  + [Eight-Bit Johnson Ring Counter](A2Q2_johnson_ring_counter.v): Uses direct assignment instead of D Flip Flops for ease in understanding.

  + [Test Bench](A1Q2_eight_bit_comparator_tb.v): Top level module which instantiates an *eight bit johnson counter*. An input *q* is given at time *t=0*, and then further at every positive edge of the clock the johnson ring counter changes the value of *q* to a new state.

The instructions used to run the files locally (on Windows 10) were-
```bash
iverilog -o ./filename.vvp ./filename.v
vvp ./filename.vvp
gtkwave.exe
```


A `README.md` has also been provided along with a `README.txt`, since it provides more functionality. The source code from the `.md` was later copied to the `.txt` file.


### Note
The file [Report](./Report.pdf) was written in a rush due to time constraints which is why it might not be proper. After the submission, some modifications have been made to it and these changes are reflected in [this file](./AltReport.pdf).