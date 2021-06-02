## novoMult.asm
## 
## Programa para calcular 5 × x - 74
## 
## $8 x 
## $9 resultado 

.text
.globl main 
main:
    ori $8, $0, 12      # x em $8
    ori $9, $0, 5       # 5 em $9
    mult $9, $8         # lo <-- 5x
    mflo $9             # $9 = 5x 
    addi $9, $9,-74     # $9 = 5x - 74 

## End of file