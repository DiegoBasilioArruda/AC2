.text
# A [ 12 ] = h + A [ 8 ]
# endereco base $s1 A

# t0 => A[8]
# 8*4 = 32
lw $t0,32 ($s1)

# t1 => h + t0
add $t1,$s0,$t0 

# A[12] => t1
# 12*4 = 48
sw $t1, 48($s1) 
