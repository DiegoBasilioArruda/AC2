# Escreva um programa que leia um número armazenado na primeira posição livre da memória.
# Após a leitura desse número, um registrador qualquer será um flag, isto é, 
# se esse número lido estiver na faixa de 50 a 100 ou 150 a 200 esse registrador 
# deverá conter um “1”, caso contrário esse registrador deverá conter “0”.
# Exemplo:
# leia número;
# se ( 50 <= número <=100 ou 150 <= número <= 200)
#   registrador flag = 1;
# caso contrério
#   registrador flag = 0;

# t0 endereco base
# s0 numero
# t1 50 <= numero
# t2 49
# t1 numero <= 100
# t2 101

# t1 150 <= numero
# t2 149
# t1 numero <= 200
# t2 201

.text

lui $t0, 0x1001                 # t0 => endereco base 0x1001 * 2^16

lw $s0,0($t0)                   # s0 => numero

PrimeiraCondicao:

    li $t2,49                   # t2 => 49

    slt $t1,$t2,$s0             # se 49 < numero == 50 <= numero

    beq $t1,$0,SegundaCondicao  # se 50 <= numero == false va para segundaCondicao

    li $t2,101                  # t2 => 101

    slt $t1,$s0,$t2             # se numero < 101 == numero <= 100

    bne $t1,$0,Retorno          # se 50 <= numero numero <= 100 == true va para Retorno

SegundaCondicao:

    li $t2,149                  # t2 => 149

    slt $t1,$t2,$s0             # se 149 < numero == 150 <= numero

    beq $t1,$0,Retorno          # se 150 <= numero == false va para Retorno

    li $t2,201                  # t2 => 201

    slt $t1,$s0,$t2             # se numero < 101 == numero <= 100

Retorno:
    sw $t1,4($t0)               # guardar na segunda posicao o valor da flag

.data
numero: .word 50
flag: .word -1