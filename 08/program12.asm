# Programa 12
# Considere a seguinte situação:
# int ***x;
# onde x contem um ponteiro para um ponteiro para um ponteiro para um inteiro.
# Nessa situação, considere que a posição inicial de memória contenha o inteiro em
# questão.
# Coloque todos os outros valores em registradores, use os endereços de memória que
# quiser dentro do espaço de endereçamento do Mips.
# Resumo do problema:
# k = MEM [ MEM [MEM [ x ] ] ].
# Crie um programa que crie a estrutura de dados acima, leia o valor de K, o multiplique
# por 2 e o reescreva conhecendo-se apenas o valor de x.

.text
.globl main
main:
    addi $t0, $t0, 0x1001
    sll $t0,$t0, 16 #endereco base

    lw $t1, 0x4 ($t0) #t1 = ***x endereco de **x

    lw $t2, 0x0 ($t1) #t2 = **x endereco de *x

    lw $t3, 0x0 ($t2) #t3 = *x endereco do inteiro

    lw $t4, 0x0 ($t3) #t4 = x inteiro

    sll $t5, $t4, 1 #t5 = x *2

    sw $t5, 0x0 ($t0) #no endereco 0x10010000

.data
#endereco de x = 0x10010000
x: .word 0x5

#ponteiro1 = 0x10010004
ponteiro1: .word 0x10010008

#ponteiro2 = 0x10010008
ponteiro2: .word 0x1001000c

#ponteiro3 = 0x1001000c
ponteiro3: .word 0x10010000
