This is the submission for Assignment#1 from group G36. Each question contains three `verilog` files, except for Q4 which contains two verilog files and a PDF. Comments have been added in each `verilog` file wherever deemed necessary.

Further, a `$monitor` statement has been used in all the *test benches* so that the results can be verified from the command line itself. Nonetheless, `gtkwave` can still be used to inspect and verify correct functioning, and the output can be avoided simply by commenting out the line which contains `$monitor`. Some *test benches* also make use of the inbuilt function `$random` to generate unknown testcases.

The purpose of each file has been described briefly below-

+ <u>Question 1:</u> Implement an *eight-bit ripple carry counter*.

  + [One-Bit Full Adder](A1Q1_one_bit_full_adder.v): Lowest level module which takes a carry in and two bits as input and outputs their result and the carry out.

  + [Eight-Bit Adder](A1Q1_eight_bit_adder.v): Instantiates 8 *one bit adders* to add 2 *eight bit* numbers, with a given initial carry in, and outputs their result, along with the resultant carry out. It does not return each intermediate carry but the code can easily be changed to accommodate for it.

  + [Test Bench](A1Q1_eight_bit_adder_tb.v): Top level module which instantiates an *eight bit adder* to add two numbers *A* and *B*, resulting in *R*. The initial carry is assumed to be 0, but can be changed if required. Apart from the result *R*, it also returns the final carry *(C<sub>out</sub>)*. *20* random values have been generated in the range *0-255* using an inbuilt function `$random`. These serve as our test cases.

+ <u>Question 2:</u> Implement an *eight-bit comparator*.

  + [One-Bit Comparator](A1Q2_one_bit_comparator.v): Lowest level module, outputs three variables corresponding to *Greater than*, *Equality*, and *Lesser than*. The relation which holds is assigned the value 1, and the rest are assigned 0. Takes in two bits to be compared, and rolling greater than, equality, and lesser than values as input.

  + [Eight Bit Comparator](A1Q2_eight_bit_comparator.v): Instantiates 8 *one bit comparators* to compare 2 *eight bit* numbers, and returns the output as *greater than*, *equality*, and *lesser than*. Some intermediate variables have been used and initialized accordingly.

  + [Test Bench](A1Q2_eight_bit_comparator_tb.v): Top level module which instantiates an *eight bit comparator* to compare two numbers *A* and *B*, and returns three variables corresponding to *greater than*, *equal to*, and *lesser than*. *4* standard values have been assigned initially and *16* random values have been generated in the range *0-254* using an inbuilt function `$random`. These serve as our test cases.
  
+ <u>Question 3:</u> Implement a *3-to-8 decoder*.

  + [2-to-4 Decoder](A1Q3_two_to_four.v): Lowest level module, assigns the *4 bits* of output using simple boolean expressions which are a function of the *2 bits* of the input and the enabler.

  + [3-to-8 Decoder](A1Q3_three_to_eight.v): Instantiates 2 *2-to-4 decoders* and uses them to assign values to output. A part of the input is used in the enabling the the 2 decoders, thus maintaining optimality in the number of decoders used.

  + [Test Bench](A1Q3_three_to_eight_tb.v): Top level module, instantiates a *3-to-8 decoder*. All *8* possible inputs are given to the decoder and the corresponding outputs are calculated. The enabler for the *3-to-8 decoder* is initialized to 1 but can be changed easily if required.
  
+ <u>Question 4:</u> Implement a *8-to-3 priority encoder*.

  + [8-to-3 Priority Encoder](A1Q4_eight_to_three.v): Lower level module. Uses simplified boolean expressions containing the *8 bits* of input to assign priority to the rightmost bit which is 1. The default priority is assumed to be 7 when the input is 0. This is also a consequence of the choice of the *don't care* term in the [Karnaugh Map](A1Q4_KMaps.pdf) to simplify the resulting boolean expressions (for the rightmost and middle bit in the priority).

  + [Test Bench](A1Q4_eight_to_three_tb.v): Top level module which instantiates an *8-to-3 priority encoder*. *8* random inputs have been written manually to show priority being assigned to each number in the range *0-7*. Further, *7* random inputs in the range *0-254* have been generated using the library function `$random`. These constitute our *15* test cases.

  + [K-Map](A1Q4_KMaps.pdf): The boolean expressions for the *middle* and the *rightmost* bit in the encoded priority were not immediately clear. Hence, a *16\*16 Karnaugh Map* was made for the same, and the expression was inferred from it. Since the map formed an integral part, we have included it for the sake of completeness.


The instructions used to run the files locally (on Windows 10) were-
```bash
iverilog -o ./filename.vvp ./filename.v
vvp ./filename.vvp
gtkwave.exe
```


A `README.md` has also been provided along with a `README.txt`, since it provides more functionality. The source code from the `.md` was later copied to the `.txt` file.