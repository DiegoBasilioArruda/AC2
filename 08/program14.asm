.text

addi $t9, $0, 0x1001
sll $t9, $t9, 16

lw $s0, 0($t9)

addi $t0, $0, 0x1E
slt $s1, $t0, $s0    # $s1 -> $t0 < $s0 
bne $s1, $0, true1   # if s1 != 0 (eh verdadeiro) : true1
beq $s0, $t0, true1  # if $s0 == $t0 : true1 
j flag0              # else : flag0

true1:
     addi $t1, $0, 0x32	 # t1 -> 0x32 (50)
     slt $s1, $s0, $t1   # s1 -> $s0 < $t1
     beq $s1, $0, false  # if $s1 == 0 (eh maior)
     j flag1
     
false:
     bne $s0, $t1, flag0   # if $s0 != $t1 : FIM
     j flag1
     
flag1:
     addi $s3, $0, 0x1
     sw $s3, 4($t9)
     j FIM
	         
flag0:
     addi $s3, $0, 0x0
     sw $s3, 4($t9)
     j FIM

FIM: 

.data 
TEMP: .word 50 # 0x1001000
FLAG: .word -1  # 0x1001004 
