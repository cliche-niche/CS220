.data
    size:   .word  10 # Size of array is 10 (words)
    arr:    .space 40
    prompt: .asciiz "\nEnter the next element:\n"
    result: .asciiz "\n\n\nThe sorted array is:\n"
    tab:    .asciiz "\t"


.text

main:
    # Initializing arguments for reading input of an array of size `size`
    la      $a0, prompt
    lw      $a1, size
    la      $a2, arr
    jal     read_input

    # Initializing arguments for Sorting
    la      $a0, arr
    addi    $a0, $a0, 4             
    ori     $a1, $0, 1
    lw      $a2, size
    jal     sort

    # Printing the resulting array
    la      $a0, result             # Printing the string in `result`
    ori     $v0, $0, 4
    syscall
    lw      $a1, size               # $a1 has the size of the array
    la      $a2, arr                # $a2 holds the address of the array
    jal     print_arr

    ori     $v0, $0, 10             # Exiting
    syscall


read_input:
    ####
    #   $a0 :=  Always has the same expression, the string referred to, by `prompt`
    #   $a1 :=  Initially holds the size of the array to be read decreased by 1 after each iteration
    #           Initial value can be changed from `.data`
    #   $a2 :=  Initially holds the address of the array the input is supposed to be read into
    ####
    beq     $a1, $0, return         # All inputs have been read

    la      $a0, prompt             # Reading a single number
    ori     $v0, $0, 4
    syscall
    ori     $v0, $0, 5
    syscall
    sw      $v0, 0($a2)             # Storing the number into the array

    addi    $a2, $a2, 4
    addi    $a1, $a1, -1
    j       read_input              # Next input being read

print_arr:
    beq     $a1, $0, return         # All elements have been printed

    ori     $v0, $0, 1              # Printing a single number
    lw      $a0, 0($a2)
    syscall
    ori     $v0, $0, 4
    la      $a0, tab
    syscall

    addi    $a2, $a2, 4
    addi    $a1, $a1, -1
    j       print_arr               # Next element being printed




sort:
    ####
    #   $a0 :=  Iterates over the addresses in the array starting from the second element
    #           Loop invariant holds that array upto $a0 shall be sorted whenever `sort` is called
    #   $a1 :=  Holds the index of the array upto which it is currently sorted [in 1-based indexing]
    #   $a2 :=  Holds the size of the complete array, used for better interpretations
    ####
    slt     $t0, $a1, $a2
    beq     $t0, $0, return         # $a1 >= $a2, i.e., all elements have been sorted
    # Saving the values of $a0, $a1, $a2 before beginning insertion
    addi    $sp, $sp, -12
    sw      $a2, 8($sp)
    sw      $a1, 4($sp)
    sw      $a0, 0($sp)
    lw      $a2, 0($a0)
    addi    $a0, $a0, -4
insertion_beg:                      # Beginning/ Intermediate stage of insertion
    ####
    #   $a0 :=  Address of the current element to compare, iterates over the sorted segment
    #   $a0 :=  Number of elements remaining in the sorted segment to be compared (potentially)
    #   $a2 :=  Value of the element to be inserted
    ####
    beq     $a1, $0, insertion_end  # All elements in the sorted segment have been compared, reached end of insertion
    lw      $t1, 0($a0)             # Loading the element to be compared to the element being inserted
    slt     $t0, $a2, $t1
    beq     $t0, $0, insertion_end  
    # Stable sort; `$a2 >= $t1`, end of insertion
    # Preparing for the next element in the sorted segment to compare
    sw      $t1, 4($a0)
    addi    $a1, $a1, -1
    addi    $a0, $a0, -4
    j       insertion_beg
insertion_end:                      # End of insertion, the element is being stored in its respective position
    # $a0 contains the address of the element which is equal to or just lesser than $a2, hence $a2 should be written in 4($a0)
    sw      $a2, 4($a0)
    # Restoring the values of $a0, $a1, $a2
    lw      $a2, 8($sp)
    lw      $a1, 4($sp)
    lw      $a0, 0($sp)
    addi    $sp, $sp, 12
continue:                           # Preparing for the next iteration of sort
    addi    $a1, $a1, 1
    addi    $a0, $a0, 4
    j       sort


return:
    jr      $ra