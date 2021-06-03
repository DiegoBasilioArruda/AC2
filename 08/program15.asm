.text
addi $t0, $0, 0x1001
sll $t0, $t0, 16

lw $s0, 0($t0)

addi $t1, $0, 0x0  # contador($t1) -> 0
addi $t2, $0, 0x64 # tam -> 0x64 (100)
j LOOP

LOOP:
    sll $s1, $t1, 1     # 2*i
    addi $s1, $s1, 0x1  # 2*i + 1
    
    sw $s1, 0($t0)
    addi $t0, $t0, 0x4  # $t0 -> $t0 + 4
    
    addi $t1, $t1, 0x1  # $t1 -> $t1 + 1 (contador)
    
    bne $t1, $t2, LOOP  # if $t1 != $t2 : LOOP
    j SOMA

SOMA: 
   addi $t0, $0, 0x1001
   sll $t0, $t0, 16
   
   addi $t1, $0, 0x0  # contador($t1) -> 0
   addi $t2, $0, 0x64 # tam -> 0x64 (100)
   
   addi $s0, $0, 0x0  # valor inicial da soma
   
   j LOOP2
   
LOOP2:
   
   lw $t3, 0($t0)
   add $s0, $s0, $t3
   
   addi $t0, $t0, 0x4 # $t0 -> $t0 + 4 (endereço)
   addi $t1, $t1, 0x1  # $t1 -> $t1 + 1 (contador)
      
   bne $t1, $t2, LOOP2  # if $t1 != $t2 : LOOP
   j FIM
   
FIM:
   sw $s0, 0($t0)


.data 
vetor: .word 0 # 0x1001000

