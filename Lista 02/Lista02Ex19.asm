# Escreva um programa que calcule a mediana de 3 números armazenados na memória. Após encontrar 
# essa mediana, escrevê-la na posição seguinte aos 3 números.
# Exemplo:
# .data
# A: .word 23
# B: .word 98
# C: .word 17
# Os três números acima serão armazenados na memória quando o programa for iniciado.
# A mediana é maior ou igual a um dos inteiros e menor ou igual ao outro.
# No caso acima, a mediana é o número 23
# Um outro caso possível:
# .data
# A: .word 9
# B: .word 98
# C: .word 9
# Nesse caso a mediana é o "9".
# Considere que os números nas posições A, B e C podem ser trocados de rodada para rodada do seu 
# programa.

# t0 endereco base
# s0 A
# s1 B
# s2 C
# s3 maior
# s4 menor
# s5 mediana

.text

lui $t0, 0x1001                 # t0 => endereco base 0x1001 * 2^16

lw $s0,0($t0)                   # s0 => A
lw $s1,4($t0)                   # s1 => B
lw $s2,8($t0)                   # s2 => C

slt $t1,$s0,$s1                 # A < B

bne $t1,$0,B_Maior              # se A < B == 1 va para B_Maior
A_Maior:
    add $s3,$s0,$0              # maior => A
    add $s4,$s1,$0              # menor => B
    j ValidandoMaior
B_Maior:
    add $s3,$s1,$0              # maior => B
    add $s4,$s0,$0              # menor => A
ValidandoMaior:
    slt $t2,$s2,$s3             # C < maior
    bne $t2,$0,Maior            # se C < maior == 1 va para Maior
C_Maior:
    add $s5,$s3,$0              # mediana = maior
    j Retorno
Maior:
    slt $t3,$s4,$s2             # menor < C
    bne $t3,$0,C_Mediana        # menor < C == 1 va para C_Mediana
Menor_Mediana:
    add $s5,$s4,$0              # mediana = menor
    j Retorno
C_Mediana:
    add $s5,$s2,$0              # mediana = C
Retorno:
    sw $s5,12($t0)

.data
A: .word 98
B: .word 23
C: .word 17
Mediana: .word -1