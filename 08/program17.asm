.text
addi $t0, $0, 0x1001
sll $t0, $t0, 16

lw $s0, 0($t0) # $s0 -> x
div $t0, $s0, 0x2
mfhi $t0 # resto da divisao

beq $t0, $0, PAR
j IMPAR

PAR: 
   # x^4
   addi $t8, $0, 0x3 # contador = expoente-1
   addi $t1, $s0, 0x0
   LOOP_ELEVAR1: # return -> $t1
       mult $s0, $t1
       mflo $t1
       addi $t8, $t8, -0x1 # contador--
       bne $t8, $t0, LOOP_ELEVAR1
   addi $s2, $t1, 0x0
   
   # x^3
   addi $t8, $0, 0x2 # contador = expoente-1
   addi $t1, $s0, 0x0
   LOOP_ELEVAR2: # return -> $t1
       mult $s0, $t1
       mflo $t1
       addi $t8, $t8, -0x1 # contador--
       bne $t8, $t0, LOOP_ELEVAR2
   add $s2, $s2, $t1 
   
   # 2*x^2
   addi $t8, $0, 0x1 # contador = expoente-1
   addi $t1, $s0, 0x0
   LOOP_ELEVAR3: # return -> $t1
       mult $s0, $t1
       mflo $t1
       addi $t8, $t8, -0x1 # contador--
       bne $t8, $t0, LOOP_ELEVAR3
   
   sll $t1, $t1, 1 # x^2 * 2
   
   sub $s2, $s2, $t1 # x^4 + x^3 - 2*x^2
   j FIM
   
IMPAR:
   # x^5
   addi $t8, $0, 0x5 # contador = expoente
   addi $t1, $s0, 0x0
   LOOP_ELEVAR4: # return -> $t1
       mult $s0, $t1
       mflo $t1
       addi $t8, $t8, -0x1 # contador--
       bne $t8, $t0, LOOP_ELEVAR4
   
   addi $s2, $t1, 0x0

   # x^3
   addi $t8, $0, 0x3 # contador = expoente
   addi $t1, $s0, 0x0
   LOOP_ELEVAR5: # return -> $t1
       mult $s0, $t1
       mflo $t1
       addi $t8, $t8, -0x1 # contador--
       bne $t8, $t0, LOOP_ELEVAR5
       
   sub $s2, $s2, $t1
   addi $s2, $s2, 0x1
   j FIM

       
FIM: 
   addi $t0, $0, 0x1001
   sll $t0, $t0, 16
   sw $s2, 4($t0)

.data 
x: .word 3 # 0x1001000
y: .word -1 # 0x1001004