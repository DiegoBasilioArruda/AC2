.text

lui $t0, 0x1001

lw $a0, 0 ($t0)             # a0 => x
lw $a1, 4 ($t0)             # a1 => y

mult $a0, $a1               # lo <-- x * y
mflo $t1                    # t1 => x * y < 32bits

sw $t1, 8 ($t0)            # resultado => t2

.data 
x: .word 10
y: .word 2
k: .word 0