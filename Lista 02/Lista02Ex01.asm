.text
.globl main
main:
    # a => 10
    addi $t0,$0, 10

    # b => -1
    addi $t1,$0,-1

    # a => a + 1
    addi $t0,$t0,1

    # b => a + b
    add $t1,$t0,$t1