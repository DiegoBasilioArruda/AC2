.text

lui $t0,0x1001

lw $s0,0($t0)

srl $t1,$s0,31

bne $t1,$0,Negativo
j Fim

Negativo:
    sub $s0,$0,$s0      # x => 0 - x

Fim:
    sw $s0,4($t0)


.data
x: .word 10
moduloX: .word -1