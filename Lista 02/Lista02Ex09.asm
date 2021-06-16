.text
.globl main
main:
    # A [ j ] = h + A [ i ] 
    # A[] => s0
    # j => s1
    # h => s2
    # i => s3

    # t0 => 4j
    sll $t0,$s1,2

    # t1 => endereco base + 4j
    add $t1,$s0,$t0

    # t2 => 4i
    sll $t2,$s3,2

    # t3 => endereco base + 4i
    add $t3,$s0,$t2

    # t4 => A[endereco base + 4i]
    lw $t4, 0 ($t3)

    # t5 => h + A[ i ]
    add $t5,$s2,$t4

    # A[ j ] => t5
    sw $t5, 0($t1)
