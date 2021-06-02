# Programa 10
# Considere o seguinte programa: y = 127x – 65z + 1
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores
# de x e z estão armazenados na memória e, na posição imediatamente a seguir, o valor de
# y deverá ser escrito, ou seja:
# .data
# x: .word 5
# z: .word 7
# y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa.

.text
.globl main
main:

    addi $t0, $t0, 0x1001
    sll $t0,$t0, 16 #endereco base

    lw $s0, 0x0 ($t0) #s0 = x
    sll $t1, $s0, 7 #$t1 = 128x
    sub $t1, $t1, $s0 #$t1 = 128x -x

    lw $s1, 0x4 ($t0) #s1 = z
    sll $t2, $s1, 6 #$t2 = 64z
    add $t2, $t2, $s1 #$t2 = 64z + z

    sub $t3, $t1, $t2 #$t3 = 127x - 65z
    addi $t3, $t3, 0x1 #$t3 = 127x – 65z + 1

    sw $t3, 0x8 ($t0) #no endereco 0x10010008

.data
x: .word 5
z: .word 7
y: .word -1
