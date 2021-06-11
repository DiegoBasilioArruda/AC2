.text

lui $t0, 0x1001

lw $a0, 0 ($t0)             # a0 => x
lw $a1, 4 ($t0)             # a1 => y
lw $a2, 8 ($t0)             # a2 => z

mult $a0, $a1               # lo <-- x * y
mfhi $t1                    # t1 => x * y > 32bits
mflo $t2                    # t2 => x * y < 32bits

sll $t1, $t1, 24            # t1 => 0x 1d00 0000
srl $t2, $t2, 8             # t2 => 0x 00cd 6500

add $t1,$t1,$t2             # t1 => 0x 1dcd 6500

div $t1, $a2

mfhi $t1                    # t1 => 0x 0000 0000
mflo $t2                    # t2 => 0x 0000 04e2

sll $t2, $t2, 8             # t2 => 0x 0004 e200

sw $t2, 12 ($t0)            # resultado => t2

.data 
x: .word 0x186A00
y: .word 0x13880
z: .word 0x61A80
resultado: .word -1