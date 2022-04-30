# Q.1 Write a MIPS assembly language code to calculate and display the value
# of the slope of the line connecting the two points whose coordinates are 
# (x1, y1) and (x2, y2). 

.data
    first: .asciiz "Enter the coordinates (x1, y1) of the first point:\n"
    second: .asciiz "Enter the coordinates (x2, y2) of the second point:\n"
    result: .asciiz "\nThe slope of the line is: "
    line: .asciiz "\nThe two points lie on the same vertical line."
    point: .asciiz "\nThe two points are co-incident."


.text

main:
    la $a0, first
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 7
    syscall
    mov.d $f2, $f0
    ori $v0, $0, 7
    syscall
    mov.d $f4, $f0

    la $a0, second
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 7
    syscall
    mov.d $f6, $f0
    ori $v0, $0, 7
    syscall
    mov.d $f8, $f0

    c.eq.d $f2, $f6
    bc1t sameLine

    sub.d $f2, $f2, $f6
    sub.d $f4, $f4, $f8
    div.d $f12, $f4, $f2

    la $a0, result
    ori $v0, $0, 4
    syscall
    ori $v0, $0, 3
    syscall
    j return

sameLine:
    c.eq.d $f4, $f8
    bc1t samePoint

    la $a0, line
    ori $v0, $0, 4
    syscall

    j return

samePoint:
    la $a0, point
    ori $v0, $0, 4
    syscall

return:
    ori $v0, $0, 10
    syscall



# Sample Input (x1, y1), (x2, y2)           Sample Output (Slope)
#              (12, 12), (2, 2)                     1
#              (12, 2), (12, 4)              Same vertical line
#              (12, 12), (2, 12)                    0
#              (12, 12), (12, 12)               Same points
#              (0, 7),   (2, 14)                   3.5