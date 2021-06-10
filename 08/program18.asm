.text

lui $t0, 0x1001

lw $a0, 0 ($t0)             # a0 => x

addi $sp,$sp -8             # adicionando na pilha
sw $t0, 8($sp)              # guardando $t0 na pilha
sw $a0, 4($sp)              # guardando $a0 na pilha


slt $t1, $0,$a0             # Se 0 < x
beq $t1, $0 , Else          # nao => va para Else
jal MaiorZero               # chamando funcao Se x > 0

j Continua

Else:
jal MenorIgualZero          # chamando funcao Se x <= 0

Continua:

lw $t0, 8($sp)              # reatribuindo o valor de t0        
lw $a0, 4($sp)              # reatribuindo o valor de a0
addi $sp,$sp, 8             # voltar na pilha

sw $v0, 4($t0)              # guardando o resultado na segunda posicao

j Fim

# a0 = valor
# a1 = expoente
Elevar:
    addi $sp,$sp,-8         # adicionando na pilha
    sw $s0, 8($sp)          # guardando $s0 na pilha
    sw $s1, 4($sp)          # guardando $s1 na pilha

    add $s0, $a0,$0         # s0 = resultado + valor

    addi $s1, $a1, -1       # a1 = expoente -1
# a1 = numero de repeticoes
Loop:
    slt $t0, $0, $s1        # se 0 < a1
    beq $t0, $0, FimLoop    # nao => va pra FimLoop
    addi $s1, $s1, -1       # repeticoes -1 
    mult $s0, $a0
    mflo $s0
    j Loop                  # volta ao loop
FimLoop:

    add $v0,$s0,$0          # atribui o retorno

    lw $s0, 8($sp)          # reatribuindo o valor de s0
    lw $s1, 4($sp)          # reatribuindo o valor de s1
    addi $sp,$sp, 8         # voltar na pilha

    jr $ra                  # retorna 

# a0 => x
MaiorZero:
    addi $sp,$sp,-8         # adicionando na pilha
    sw $ra, 8($sp)          # guardando $ra na pilha
    sw $a1, 4($sp)          # guardando $a1 na pilha => expoente

    addi $a1, $0,3          # a1 => 3

    #TODO CORPO
    jal Elevar              # v0 => x^3

    addi $v0,$v0,1          # v0 => x^3 + 1

    lw $ra, 8($sp)          # reatribuindo o valor de $ra
    lw $a1, 4($sp)          # reatribuindo o valor de $a1
    addi $sp,$sp, 8         # voltar na pilha

    jr $ra                  # retorna

# a0 => x
MenorIgualZero:
    addi $sp,$sp,-8         # adicionando na pilha
    sw $ra, 8($sp)          # guardando $ra na pilha
    sw $a1, 4($sp)          # guardando $a1 na pilha => expoente

    addi $a1, $0,4          # a1 => 4

    #TODO CORPO
    jal Elevar              # v0 => x^4

    addi $v0,$v0,-1         # v0 => x^4 - 1

    lw $ra, 8($sp)          # reatribuindo o valor de $ra
    lw $a1, 4($sp)          # reatribuindo o valor de $a1
    addi $sp,$sp, 8         # voltar na pilha

    jr $ra                  # retorna

Fim:

.data 
x: .word 2
y: .word -1