.text
addi $t0, $0, 0x1001
sll $t0, $t0, 16

lw $s0, 0($t0)

addi $t1, $0, 0x0  # contador($t1) -> 0
addi $t2, $0, 0x64 # tam -> 0x64 (100)
addi $t3, $0, 0x64 # aux -> 0x64 (100)
j LOOPCriarVetor

LOOPCriarVetor: # colocar elementos no vetor (decrescente_
    sw $t3, 0($t0) 
    
    addi $t0, $t0, 0x4  # $t0 -> $t0 + 4
    addi $t1, $t1, 0x1  # $t1 -> $t1 + 1 (contador)
    addi $t3, $t3, -0x1 # $t3--
    
    bne $t1, $t2, LOOPCriarVetor  # if $t1 != $t2 : LOOP
    j BubbleSort
    
BubbleSort:
        addi $t1, $0, 0x0 # contador (i)
	j LOOP1 # mais interno

LOOP1:
    addi $t4, $0, 0x0 # j = 0
    sub $t3, $t2, $t1 # parada -> tam-i
    j LOOP2 # mais externo
    
CONTINUE:
    addi $t1, $t1, 0x1 # i++
    bne $t1, $t2 LOOP1 #
    j FIM
    
LOOP2:
   addi $t8, $0, 0x1001 # controle de acesso a mem
   sll $t8, $t8, 16  # MEM [ J ]
   addi $t9, $t8, 0x4   # MEM [ J + 1 ]  
   
   FOR:
      lw $s0, 0($t8) # $s0 -> MEM[J]
      lw $s1, 0($t9) # $s0 -> MEM[J+1] 
      
      # if MEM [ J + 1 ] < MEM [ J  ] :
      slt $t5, $s1, $s0
      bne $t5, $0, SWAP # if true
      
      CONTINUE_FOR:
      addi $t8, $t8, 0x4 # MEM[J] = MEM[J+1]
      addi $t9, $t9, 0x4 # MEM[J+1] = MEM[J+1+1] 
      addi $t4, $t4, 0x1 # j++
      bne $t4, $t3, FOR # if -> j != tam-i(parada)
   j CONTINUE

SWAP:
   sw $s1, 0($t8)
   sw $s0, 0($t9)
   j CONTINUE_FOR 
         
FIM: 
.data 
vetor: .word 0 # 0x1001000