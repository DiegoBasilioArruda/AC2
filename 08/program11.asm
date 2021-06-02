# Programa 11
# Considere o seguinte programa: y = x – z + 300000
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores
# de x e z estão armazenados na memória e, na posição imediatamente a seguir, o valor de
# y deverá ser escrito, ou seja:
# .data
# x: .word 100000
# z: .word 200000
# y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa.

.text
.globl main
main:
    addi $t0, $t0, 0x1001
    sll $t0,$t0, 16 #endereco base

    addi $t1, $t1, 0x493E
    sll $t1,$t1, 4 #$t1 = 300000

    lw $t2, 0x0 ($t0) #t2 = x

    lw $t3, 0x4 ($t0) #t3 = z

    sub $t2, $t2 , $t3 #t2 = x - z

    add $t2, $t2, $t1 #$t2 = x - z + 300000

    sw $t2, 0x8 ($t0) #no endereco 0x10010008

.data
x: .word 0x186A0
z: .word 0x30D40
y: .word -1
