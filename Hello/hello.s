.data
hw: .asciiz "Hello, World!"

.text
.globl main
main:   addi    $v0, $zero, 4
        la      $a0, hw
        syscall
        jr		$ra
        