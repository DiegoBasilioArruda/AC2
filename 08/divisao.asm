## exemplodiv.asm
## 
## Programa para calcular (y + x) / (y - x)
## 
## $8 x 
## $9 y 
## $10 x/y 
## $11 x%y 

.text.globl main 
main:
    ori $8, $0, 8       # x em $8
    ori $9, $0, 36      # y em $9
    add $10, $9, $8     # $10 <-- (y+x)
    sub $11, $9, $8     # $11 <-- (y-x) 
    div $10, $11        # hilo <-- (y+x)/(y-x) 
    mflo $10            # $10 <-- quociente
    mfhi $11            # $11 <-- resultado
## End of file