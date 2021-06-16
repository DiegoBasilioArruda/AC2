# Escreva um programa que leia da memória um valor de Temperatura TEMP. Se TEMP>=30 e TEMP 
# <=50 uma variável FLAG, também na memória, deverá receber o valor 1, caso contrário, 
# FLAG deverá ser zero.

# t0 => endereco base
# s0 => TEMP
# s1 => FLAG
# t1 => 30
# t2 => 50
# t3 => >= 30
# t4 => <= 50


.text
.globl main
main:
    lui $t0, 0x1001         # t0 => endereco base

    lw $s0, 0($t0)          # s0 => TEMP

    addi $t1,$0,29          # t1 => 29
    addi $t2,$0,51          # t2 => 51

    slt $t3,$t1,$s0         # Se 29 < TEMP
    slt $t4,$s0,$t2         # Se TEMP < 51

    bne $t3,$t4,false       # Se t3 != t4 => false
    bne $t3,$0,true         # Se t3 != 0 => true

false:
    add $s1,$0,$0           # FLAG => 0
    j fim                   # va para fim
true:
    add $s1,$0,$t3          # FLAG => 1
fim:
    sw $s1,4($t0)           # armazenar FLAG


.data 
TEMP: .word 50              # 0x1001000
FLAG: .word -1              # 0x1001004 
