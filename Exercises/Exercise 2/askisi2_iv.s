.arm
.text
.global main

main:

STMDB R13!, {R0-R7, R14} @ Apo8hkeysh merikwn kataxwrhtwn sto stack

LDR R0, =TABLE_A         @ arxh pinaka A
LDR R1, =TABLE_B         @ arxh pinaka B
LDR	R2, =TABLE_G         @ arxh pinaka G

@ ---- 1o LS word: ADDS me ta 32 ligotera shmantika psifia ----

LDR  R4, [R0], #4
LDR  R5, [R1], #4
ADDS R6, R4, R5
STR  R6, [R2], #4 

@ ---- upoloipa 3 words: ADCS mesa brogxo

MOV R3, #3              @ metrhths stoixeiwn (3 words prostheseis akoma)

loop:

LDR R4, [R0], #4        @ R4 = A[i] & R0 += 4
LDR R5, [R1], #4        @ R5 = B[i] & R1 += 4
ADCS R6, R4, R5         @ R6 = A[i] + B[i] + C_flag (CPSR'S C = 1 an exoyme kratoymeno)
STR R6, [R2], #4        @ Grafei mono ta 32 LSB sto G[i] & R2 += 4

@ ---- swzoyme to carry-out ston R7 dioti me thn SUBS endexetai na mas allajei to C
MOV R7, #0
ADC R7, R7, #0

SUBS R3, R3, #1         @ R3-- & enhmerwse flags CPSR
BEQ done                @ An R3 = 0 tote bges apo ton brogxo kai phgaine sthn etiketa done

@ ---- Epanaferoyme to C gia thn epomenh epanalhpsh
CMP R7, #1
B loop

done:
LDMIA R13!, {R0-R7, PC}  @ epanafora kataxwrhtwn

.data

.align 4                 @ aparaithto dioti ta dedomena prepei na topothetithoyn se dieythunseis poy einai pol/sia toy 4, dioti exoyme words 

TABLE_A:
.byte 32,127,254,57,22,111,48,11,87,45,114,45,66,23,134,168

TABLE_B:
.byte 19,1,18,89,90,112,89,32,23,98,67,83,146,140,200,67

TABLE_G:
.space 16, 0             @ 16 bytes me arxikh timh 0 gia ta apotelesmata
