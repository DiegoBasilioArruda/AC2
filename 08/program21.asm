.text

lui $t0, 0x1001

lw $a0, 0 ($t0)             # a0 => x
lw $a1, 4 ($t0)             # a1 => y

addi $sp,$sp -12            # adicionando na pilha
sw $t0, 12($sp)             # guardando $t0 na pilha
sw $a0, 8($sp)              # guardando $a0 na pilha
sw $a1, 4($sp)              # guardando $a1 na pilha

jal Elevar                  # chamando funcao Loop

#TODO carregar o antigo $t0
lw $t0, 12($sp)             # reatribuindo o valor de t0        
lw $a0, 8($sp)              # reatribuindo o valor de a0
lw $a1, 4($sp)              # reatribuindo o valor de a1
addi $sp,$sp, 12            # voltar na pilha


sw $v0, 8($t0)

j FimElevar

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

FimElevar:

.data 
x: .word 2
y: .word 3
k: .word 0