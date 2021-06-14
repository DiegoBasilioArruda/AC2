.text
# h = k + A [ i ]
# h => s0
# k => s1
# i => s2
# A[] => s3

# t0 => 4i
sll $t0,$s2,2

# t1 => endereco base + 4i
add $t1,$s3,$t0

# t2 => A[endereco base + 4i]
lw $t2, 0 ($t1)

# s0 => k + A [ i ]
add $s0,$s1,$t2
