This is the assignment (A#3) submission from group G#36. Both the questions contain 2 `verilog` files and a common report.
Comments have been added in each `verilog` file wherever deemed necessary. For the second question, we have implemented an alternate approach that uses an FSM (Finite State Machine) with 5-states, and prints only the final output.

The *input-output* pairs in test-benches of both the questions have been printed, so the functioning can be verified from the
command line if required. Nonetheless, the results can be verified from verrilog as well. <br>
<u>Note:</u> The I/O pair printed in Q2 (using the 2-state FSM) correspond to all intermediate as well as the final changes in input **or** output. As a result, not all the pairs are relevant, rather, only the last output corresponding to an input is valid.

All the *FSM's* implemented are *Mealy Machines*.

The purpose of each file has been described briefly below-

+ <u>Question 1:</u> Implement a *sequence detector* which detects the sequence *1010* in an input stream.
  + [Sequence Detector](./Q1/seq_detector.v)- Detects the sequence *1010* in an input stream by reading one bit from the stream per clock cycle. Outputs *1* whenever the sequence is fully realized and 0 in all other cases. Uses multiple `always` blocks.
  
  + [Test Bench](./Q1/seq_det_tb_.v)- Test bench for the sequence detector. Instantiates the module written for the detector, and makes it operate on *8-bit* streams but the size of the input stream can easily be changed. Has ~20 randomly chosen inputs.

+ <u>Question 2:</u> Implement an *odd parity generator* for a 3-bit input/ message.
  + Odd Parity Generator- Has two implementations, one FSM which has 2 states (in the folder `Two-state FSM`) and one, which has 5 states (in the folder `Five-state FSM`).<br>
  One of the major difference is the instant at which output is changed, in the 2-state FSM, it is changed after each input bit has been read, while in the 5-state FSM, the input bit is changed only after reading the 3-bits. Also, the 2-state FSM has a single `always` block.

  + Test Bench- Both of these have test benches in the same folder as the module definitions, with firstly, the input stream going *000* through *111* sequentially. And after that, some random inputs are fed into them for verification. Has ~20 random inputs because the sequence of inputs is significant while verifying correct resetting.

+ <u>Report:</u> Contains a brief description about the states of the *FSM* used for each question, its state table, excitation table, logic diagram, etc.

The instructions used to run the files locally (on Windows 10) were-
```bash
iverilog -o ./filename.vvp ./filename.v
vvp ./filename.vvp
gtkwave.exe
```

### Note
The final submission was based on the 2-state FSM, however the 5-state FSM has been included as well because it was written before.