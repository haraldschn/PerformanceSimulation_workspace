.text
.globl main

main:
    addi sp, sp, -16
    mv x7, sp
    mv x8, sp
    mv x9, sp
    mv x11, sp
    j entry
    nop
    nop
    nop

entry:
    lw x12, 8(x9)
    lw x13, 0(x7)
    div x17, x13, x12
    div x5, x7, x7
    addi x18, x12, 28
    mul x19, x12, x18
    mul x10, x17, x14
    add x10, x10, x13
    sw x10, 0(x11)
    lw x10, 4(x8)
    addi x13,x10, 4
    j exit

    nop
    nop
    nop
exit:
    addi    sp, sp, 16
    ret
