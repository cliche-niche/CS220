A table of some common operations and registers used in MIPS (mainly for personal reference).

## Registers

| Number | Name | Use |
|:-:|:-:|:-:|
| 0 | $zero | Constant 0 |
| 1 | $at | Reserved for assembler |
| 2-3 | $v0-$v1 | Return value(s) from a function<sup>*</sup>|
| 4-7 | $a0-$a3 | Argument(s) to a function<sup>#</sup>|
| 8-15 | $t0-$t7 | Temporary Registers |
| 16-23 | $s0-$s7 | Saved Registers |
| 24-25 | $t8-$t9 | Temporary Registers |  
| 26-27 | $k0-$k1 | Reserved for OS Kernel |  
| 28 | $gp | Global Pointer |  
| 29 | $sp | Stack Pointer |
| 30 | $fp | Frame Pointer |  
| 31 | $ra | Return Address |  

<sup>*</sup> `$v0` serves as the code of the system service to be requested from the kernel when `syscall` is issued.<br>
<sup>#</sup> `$a0$` stores the argument values of the `syscall` when it is issued. Depending on the system service, `$a1`, `$a2`, `$a3`, and `$f12` might also store argument values, and the input values may be stored in `$a0` or `$f0` depending upon the `syscall`.

## Instructions

| Syntax | Name | Brief Description |
|:-:|:-:|:-:|
| `syscall` | system call | `$v0` holds the call code<br> `$a0` is the argument |
|  | print_int | `$v0=1` |
|  | print_float | `$v0=2`, `$f12` is the argument |
|  | print_string | `$v0=4` |
|  | read_int | `$v0=5`, stored in `$v0` |
|  | read_float | `$v0=6`, stored in `$f0` |
|  | exit | `$v0=10`, exits the program |
| `add $r0, $r1, $r2` | add | `$r0 := $r1 + $r2`|
| `addi $r0, $r1, int` | add immediate | `$r0 := $r1 + int`|
| `sub`<sup>*</sup> | subtract | `$r0 := $r1 - $r2`<br>No `subi` because `addi` includes negative integers too |
| `or/i $r, $r0, $r1/int`  | or/ immediate | `$r := $r0 \| ($r1/int)` |
| `nor`<sup>*</sup> | logical nor | `$r0 := ~($r1 \| $r2)` |
| `and/i`<sup>*</sup> | logical and | `$r0 := ($r1 & $r2/int)` |
| `la $r, addr`<sup>@</sup> | load address | Loads the address `addr` into the reg `$r` |
| `li $r, int`<sup>@</sup> | load immediate | Loads the integer `int` into the reg `$r` |
| `beq $r1, $r2, lab` | branch on equal | Jumpt to label `lab` if `$r1 = $r2`, continue otherwise |
| `bne $r1, $r2, lab` | branch on not equal | Jumpt to label `lab` if `$r1 != $r2`, continue otherwise |
| `slt/i $r0, $r1, $r2` | set on less than/ immediate | `$r0 = 1` if `$r1 < $r2`<br>`$r0 = 0` otherwise |
| `j lab` | jump | Unconditional jump to label `lab` |
| `jr $r` | jump register | Unconditional jump to register `$r` |
|  |  | Conventional return/exit from a function |
| `jal func` | jump and link | Jump to label `func` and store return address in `$ra`<br> |
|  |  | Conventional call to a function `func`|
| `lw $r0, mem` | load word | Load word from the location `mem` in memory into the register `$r0` |
| `sw $r0, mem` | store word | Store word from the register `$r0` at the location `mem` in memory |

<sup>@</sup> Pseudo-instructions<br>
<sup>*</sup> R-type/ I-type (those that have an `i` at the end) instructions similar to `add` (arithmetic)/ `or` (logical)/ `beq` (conditional branch)<br>