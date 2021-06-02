# // programa 9

.text
.globl main
main:

    addi $t0, $t0, 0x1001
    sll $t0,$t0, 16 #endereco base

    lw $s0, 0 ($t0) #s0 = x1

    add $s1, $s1, $s0 #s1 = s1 + x1
    
    lw $s0, 0x4 ($t0) #s0 = x2

    add $s1, $s1, $s0 #s1 = s1 + x2

    lw $s0, 0x8 ($t0) #s0 = x3

    add $s1, $s1, $s0 #s1 = s1 + x3

    lw $s0, 0xc ($t0) #s0 = x4

    add $s1, $s1, $s0 #s1 = s1 + x4

    sw $s1, 0x10 ($t0) #armazenando 0x46 no endereco 0x10010010

.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1
