.text
 lui $t0, 0x1001
 
 addi $s0, $0, 0x0 # valor inicial
 addi $a0, $s0, 0x1
 addi $a1, $t0, 0x0
 addi $a2, $0, 0x64 # contador = 100
 j LOOP
 
CONTINUE:
 # addi $t1, $t0, 0x194
 addi $a0, $t0, 0x0
 addi $a1, $0, 0x0 # valor inicial da soma
 addi $a2, $0, 0x64 # contador
 j LOOP2
 
CONTINUE2:
 sw $v0, 0x190($t0) 
 j FIM


# $a0 -> num
# $a1 -> pos_mem
LOOP:
 sw $a0, 0($a1)
 addi $a0, $a0, 0x1  # a0++
 addi $a1, $a1, 0x4  # mem += 4
 
 addi $a2, $a2, -0x1
 beq $a2, $0, CONTINUE
 j LOOP

# $a0 -> mem_pos
# $a1 -> valor_inicial_soma
# $a2 -> contador
LOOP2:
 lw $s1, 0($a0)
 add $a1, $a1, $s1  # a0++
 addi $v0, $a1, 0x0
 addi $a0, $a0, 0x4  # mem += 4
 
 addi $a2, $a2, -0x1
 
 beq $a2, $0, CONTINUE2
 j LOOP2

FIM:

.data
x: .word 0 # 0x10010000