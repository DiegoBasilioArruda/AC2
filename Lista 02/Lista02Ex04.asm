.text
.globl main
main:
    # x => 3
    addi $t0,$0, 3

    # y => x /4
    srl $t2,$t0,2

    # aux => 4
    addi $t1,$0,4

    # ou div 
    div $t0,$t1

    # Hi => resto
    # Lo => quociente