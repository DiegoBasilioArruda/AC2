.text
.globl main
main:
    # x => 3
    addi $t0,$0, 3

    # 2^10 = 1024
    # y => x * 1024
    sll $t1,$t0,10

    # y => y + x
    add $t1,$t1,$t0
