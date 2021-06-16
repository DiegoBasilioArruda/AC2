.text

lui $t0, 0x1001

lw $a0, 0 ($t0)             # a0 => x

addi $sp,$sp -8             # adicionando na pilha
sw $t0, 8($sp)              # guardando $t0 na pilha
sw $a0, 4($sp)              # guardando $a0 na pilha

jal Impar                   # chamando funcao Se x > 0

j Continua

Else:
jal Impar          # chamando funcao Se x <= 0

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
Par:
    addi $sp,$sp,-16        # adicionando na pilha
    sw $a3, 16($sp)         # guardando $a3 na pilha
    sw $a2, 12($sp)         # guardando $a2 na pilha
    sw $ra, 8($sp)          # guardando $ra na pilha
    sw $a1, 4($sp)          # guardando $a1 na pilha

    addi $a1, $0,4          # a1 => 4
    jal Elevar              # v0 => x^4

    add $a2,$v0,$0          # a2 => x^4

    addi $a1, $0,3          # a1 => 3
    jal Elevar              # v0 => x^3

    add $a2,$a2,$v0         # a2 => x^4 + x^3

    addi $a1, $0,2          # a1 => 2
    jal Elevar              # v0 => x^2

    addi $a3,$0,-2          # a3 => -2
    mult $v0,$a3            # -2x^2

    mflo $a3                # t1 => -2x^2

    add $v0,$a2,$a3         # v0 => x^4 + x^3 -2x^2

    lw $a3, 16($sp)         # reatribuindo o valor de $a3
    lw $a2, 12($sp)         # reatribuindo o valor de $a2
    lw $ra, 8($sp)          # reatribuindo o valor de $ra
    lw $a1, 4($sp)          # reatribuindo o valor de $a1
    addi $sp,$sp, 16        # voltar na pilha

    jr $ra                  # retorna

# a0 => x
Impar:
    addi $sp,$sp,-12        # adicionando na pilha
    sw $a2, 12($sp)         # guardando $a2 na pilha
    sw $ra, 8($sp)          # guardando $ra na pilha
    sw $a1, 4($sp)          # guardando $a1 na pilha

    addi $a1, $0,5          # a1 => 5
    jal Elevar              # v0 => x^5

    add $a2,$v0,$0          # a2 => x^5

    addi $a1, $0,3          # a1 => 3
    jal Elevar              # v0 => x^3

    sub $a2,$a2,$v0         # a2 => x^5 - x^3

    addi $v0,$a2,1         # v0 => x^5 - x^3 + 1

    lw $a2, 12($sp)         # reatribuindo o valor de $a2
    lw $ra, 8($sp)          # reatribuindo o valor de $ra
    lw $a1, 4($sp)          # reatribuindo o valor de $a1
    addi $sp,$sp, 12        # voltar na pilha

    jr $ra                  # retorna

Fim:

.data 
x: .word 2
y: .word -1