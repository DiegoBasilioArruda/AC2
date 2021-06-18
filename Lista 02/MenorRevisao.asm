.text

# t0 => endereco base
# t1 => conditions switch
# t2 => boolean

# s0 => condition
# s1 => x
# s2 => y

lui $t0,0x1001

lw $s0,0($t0)    
lw $s1,4($t0)    
lw $s2,8($t0)

beq $s0,$0,CheckX_MenorY

li $t1,1
beq $s0,$0,X_MenorY


CheckX_MenorY:

    slt $t2,$s1,$s2             # se x < y
    bne $t2,$0,X_MenorY         

CheckX_MaiorIgualY:

    slt $t2,$s1,$s2             # se x < y
    beq $t2,$0,X_MaiorIgualY    # se x >= y
    
CheckX_MaiorY:

    slt $t2,$s2,$s1             # se y < x
    bne $t2,$0,X_MaiorY         # se x > y

CheckX_MenorIgualY:

    slt $t2,$s2,$s1             # se y < x
    beq $t2,$0,X_MenorIgualY    # se x <= y


.data
condition: .word 0
x: .word 10
y: .word 5