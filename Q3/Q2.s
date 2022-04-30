# Q.2 Write a MIPS assembly language code to input a number
# N and express it of the form N=7x+y such that y<7. 
# For e.g: 22 = 7*3 + 1. Your program should print in the form: 
# N = (x, y) 
# after ending the values of x and y. 

.data
    input: .asciiz "Please enter the value of N: "
    equals: .asciiz " = ("
    comma: .asciiz ", "
    close: .asciiz ")"

.text

main:
    la $a0, input
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 5
    syscall

    ori $a0, $v0, 0
    ori $t0, $0, 7
    div $a0, $t0
    
    ori $v0, $0, 1
    syscall

    la $a0, equals
    ori $v0, $0, 4
    syscall

    mflo $a0
    ori $v0, $0, 1
    syscall

    la $a0, comma
    ori $v0, $0, 4
    syscall
    
    mfhi $a0
    ori $v0, $0, 1
    syscall

    la $a0, close
    ori $v0, $0, 4
    syscall
    
    ori $v0, $0, 10
    syscall





# Sample Input (N)      Sample Output (N = (x, y))
#       22                      22 = (3, 1)
#       46                      46 = (6, 4)
#       49                      49 = (7, 0)
#       52                      52 = (7, 3)