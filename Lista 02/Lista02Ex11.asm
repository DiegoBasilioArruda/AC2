.text
.globl main
main:
    # j = 0;
    # i = 10;
    # do 
    #  {
    #   j = j + 1;
    #  } 
    # while ( j != i );

    # j => s0
    # i => s1

    # j => 0
    add $s0,$0,$0

    # i => 10
    addi $s1,$0,10

    loop: 
        # j => j + 1
        addi $s0,$s0,1

        # se j != i
        bne $s0,$s1, loop