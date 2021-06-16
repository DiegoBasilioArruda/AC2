# Escreva um programa que compute a série de Fibonacci, a série é definida como:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Cada termo da soma é a soma dos dois termos predecessores.
# Exemplo: o termo 13 é a soma de 5 e 8.
# Escreva o programa que compute os primeiros 100 termos da série. Se não for possível 
# computar estes 100 termos, identifique a maior quantidade possível suportada pelo emulador.
# Cada termo deverá estar em uma posição da memória. O primeiro termo na primeira posição 
# livre da memória.

# t0 endereco base
# t1 contador
# t2 limite => 100

.text

lui $t0, 0x1001             # t0 => endereco base 0x1001 * 2^16

addi $t2,$0,100             # t2 => 100

addi $t1,$0,1               # inicializando o contador => 1

sw $t1,0($t0)
sw $t1,4($t0)

addi $t0,$t0,4              # novo endereco base

For:
    beq $t1,$t2,FimFor      # Se t1 == 100 Sair do loop

    add $a0,$0,$t0          # a0 => contador
    jal FibMaiorUm
    
    addi $t0,$t0,4          # novo endereco base

    sw $v0,0($t0)

    addi $t1,$t1,1          # incrementando o contador

    j For
FimFor:

j Fim

# a0 = posAtualMemoria
FibMaiorUm:
    addi $sp,$sp,-8         # adicionando na pilha
    sw $s0, 8($sp)          # guardando $s0 na pilha
    sw $s1, 4($sp)          # guardando $s1 na pilha

    lw $s0,-4($a0)          # s0 => F[posAtual-4]
    lw $s1,0($a0)           # s1 => F[posAtual]

    add $v0, $s0,$s1        # v0 = Fn + Fn-1

    lw $s0, 8($sp)          # reatribuindo o valor de $s0
    lw $s1, 4($sp)          # reatribuindo o valor de $s1
    addi $sp,$sp, 8         # voltar na pilha

    jr $ra                  # retorna

Fim: