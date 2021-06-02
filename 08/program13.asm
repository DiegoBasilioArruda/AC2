# Programa 13:
# Escreva um programa que leia um valor A da memória,  
# identifique  se o número é negativo ou não e encontre o seu módulo.
# O valor deverá ser reescrito sobre A. 

# $t0 endereco base
# $t1 A
# $t2 ultimo Byte de A
# $t3 -1
# $t4 -1*A

.text
.globl main
main:
    addi $t0, $t0, 0x1001
    sll $t0,$t0, 16     #endereco base

    lw $t1, 0x0 ($t0)           #t1 = A

    srl $t2, $t1, 31            #t2 = ultimo Bit de A

    bne $t2 ,$0 , Negativo      # if ($t2 != 0)    
    j Fim                       # (false) go to Fim

Negativo: 
    sub $t3, $0, $t2            #t3 = -1 se ultimo Bit == 1
    mult $t3, $t1               # lo <-- -1A
    mflo $t1                    # $t1 = -A

Fim:
    sw $t1, 0x0 ($t0) #no endereco 0x10010000

.data
A: .word 0x7fffffff