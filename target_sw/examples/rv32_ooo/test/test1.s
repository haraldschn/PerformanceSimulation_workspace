.text
.globl main

main:
    add a1, t1, t2
    mul a2, a0, a2
    mul a4, a1, a4
    lw t1, 0(a3)
    addi t1, t1, 4
    ret
