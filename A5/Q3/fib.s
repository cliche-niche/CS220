.data
    int:        .asciiz "Fibonacci #"
    col:        .asciiz ":\t"
    newline:    .asciiz "\n"
    end:        .asciiz "Next Fibonacci is above 500."


.text

main:
    # Printing the first two Fibonacci Numbers (0 and 1)
    ori     $a0, $0, 0
    ori     $a1, $0, 1
    jal	    print_num
    ori     $a0, $0, 1
    ori     $a1, $0, 2
    jal     print_num

    # Calling the Fibonacci function/loop
    ori     $a0, $0, 0
    ori     $a2, $0, 1
    jal     fib

    # Exiting
    la      $a0, end
    ori     $v0, $0, 4
    syscall
    ori     $v0, $0, 10
    syscall


fib:
    ####
    #   $a0 :=  Previous to Previous Fibonacci Number
    #   $a1 :=  Index of the previous Fibonacci Number
    #   $a2 :=  Previous Fibonacci Number
    ####
    
    addi    $a1, $a1, 1
    add     $a0, $a0, $a2
    slti    $t0, $a0, 500   # Checking if current Fib number<500
    bne     $t0, 1, ret     # Breaking if it is >=500

    # Saving the return address and printing the Fib number<500 along with its index
    addi    $sp, $sp, -4
    sw      $ra, 0($sp)
    jal     print_num       # Printing
    lw      $ra, 0($sp)     # Restoring the value in `$ra`
    addi    $sp, $sp, 4

    # After printing,     `$a0 <-- $a2`     &    `$a2 <-- $a0 + $a2`
    ori     $t0, $a0, 0
    ori     $a0, $a2, 0
    ori     $a2, $t0, 0
    j       fib             # Onto the next Fibonacci Number
ret:
    jr      $ra             # Returning from the function/ Exiting out of the loop


print_num:                  # Prints "Fibonacci #$a1:   $a0"
    ori     $t0, $a0, 0
    la      $a0, int
    ori     $v0, $zero, 4
    syscall

    ori     $a0, $a1, 0
    ori     $v0, $zero, 1
    syscall

    la      $a0, col
    ori     $v0, $zero, 4
    syscall

    ori     $a0, $t0, 0
    ori     $v0, $zero, 1
    syscall

    la      $a0, newline
    ori     $v0, $zero, 4
    syscall

    ori     $a0, $t0, 0
    jr      $ra