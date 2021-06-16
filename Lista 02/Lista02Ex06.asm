.text
.globl main
main:
    # x => -1
    addi $t0,$0,-1

    # aux => 32
    ori $t1,$t1, 32

    # y => x/32
    div $t0,$t1