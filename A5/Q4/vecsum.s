.data
    prompt0:    .asciiz "Enter the value of p:\n"
    prompt:     .asciiz "\nEnter the next float:\n"
    result:     .asciiz "\n\nThe result of this vector is:\t"


.text

main:
    # Reading the value of p and storing it in $a1
    la      $a0, prompt0
    ori     $v0, $0, 4
    syscall
    ori     $v0, $0, 5
    syscall
    ori     $a1, $v0, 0

    # Initializing $a0, $a1, $f12 for the function call
    ori     $a0, $0, 0
    li.s    $f12, 0.0
    jal     vector

    # Printing the result and exiting
    ori     $v0, $0, 4
    la      $a0, result
    syscall
    ori     $v0, $0, 2
    syscall
    ori     $v0, $0, 10
    syscall

vector:
    ####
    #   $a1 :=  Count of floats remaining to be read
    #   $a0 :=  Current parity, whether the current float has to be added or subtracted
    #           0 for addition (also initial value), subtraction otherwise (-1).
    #   $f12:=  Stores the current value of the additions and subtractions
    ####

    beq     $a1, $0, return # All floats have been read
    addi    $a1, $a1, -1    # Decrease count of floats remaining to be read
    ori     $t0, $a0, 0     # Saving the current parity

    # Reading the next float
    la      $a0, prompt
    ori     $v0, $0, 4
    syscall
    ori     $v0, $0, 6
    syscall
    ori     $a0, $t0, 0
    beq     $a0, $0, even   
    sub.s   $f12, $f12, $f0 # Float on an odd position (1, 3, 5, ...)
    nor     $a0, $a0, $0    # Value of $a0 is toggled
    j       vector          # Read the next float

even:
    add.s   $f12, $f12, $f0 # Float on an even position (0, 2, 4, ...)
    nor     $a0, $a0, $0    # Value of $a0 is toggled
    j       vector          # Read the next float

return:
    jr      $ra