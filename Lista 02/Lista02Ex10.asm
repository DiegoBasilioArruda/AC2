.text
# h = A [ i ] ;
# A [ i ] = A [ i + 1] ;
# A [ i + 1] = h ;

# h = s0
# A[] => s1
# i => s2
# h => s3

# t0 => 4i
sll $t0,$s2,2

# t1 => endereco base + 4i
add $t1,$s1,$t0

# h => A [ 4i ]
lw $s0, 0 ($t1)

# t2 => A [ 4i + 4]
lw $t2, 4 ($t1)

# A[ 4i ] => A [ 4i + 4]
sw $t2, 0 ($t1)

# A[ 4i + 1 ] => h
sw $s0, 4 ($t1)