# Q.3 Write a recursive function to do binary search on a given sorted array for a given element. Write a
# main function that takes a sorted array of n elements and an integer k to search in the array as inputs 
# (from keyboard) and searches for k in the array using the binary search function. If it founds the data, 
# then it will print the the index of data k or it will print "no data found."

.data
    arr: .space 40
    size: .word 10
    inp_n: .asciiz "Enter the size of the array:\n"
    array: .asciiz "\nEnter the elements in the (sorted) array:\n"
    key: .asciiz"\nEnter the key to search: "
    n_found: .asciiz "\n\nKey not found."
    found_here: .asciiz "\n\nKey found here: "

.text

main:
    la $a0, inp_n
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 5
    syscall
    ori $t6, $v0, 0
    la $a0, array
    ori $v0, $0, 4
    syscall
    move $a1, $t6
    la $a2, arr
    jal     read_input

    la $a0, key
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 5
    syscall

    ori $t3, $v0, 0
    ori $t2, $0, 0
    ori $t1, $0, 10
    ori $t5, $0, 1
    la $t7, arr
    jal bin_search

    ori $v0, $0, 10
    syscall

read_input:
    beq     $a1, $0, return

    ori     $v0, $0, 5
    syscall
    sw      $v0, 0($a2)

    addi    $a2, $a2, 4
    addi    $a1, $a1, -1
    j       read_input 

return:
    jr $ra

bin_search:
    slt $t0, $t1, $t2
    beq $t0, $t5, not_found # r<l
    sub $t4, $t1, $t2
    srl		$t4, $t4, 1			# $t4 = $t4 >> 1
    add $t0, $t2, $t4
    sll $t9, $t9, 4
    add $t8, $t9, $t7
    lw $t8, 0($t8)
    beq $t8, $t3, found
    slt $t8, $t3, $t8
    beq $t8, $0, left_half
right_half:
    addi $t1, $t0, -1
    j bin_search
left_half:
    addi $t2, $t0, 1
    j bin_search

not_found:
    la $a0, n_found
    ori $v0, $0, 4
    syscall
    jr $ra

found:
    la $a0, found_here
    ori $v0, $0, 4
    syscall
    ori $a0, $t0, 0
    ori $v0, $0, 1
    syscall
    jr $ra


# Sample Input                      Sample Output
# n=5, arr={1,4,5,7,8}, k=3             Not Found
# n=7, arr={1,2,3,4,5,7,8}, k=9             Not Found