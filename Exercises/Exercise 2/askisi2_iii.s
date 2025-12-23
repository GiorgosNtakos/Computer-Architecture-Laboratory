.arm
.text
.global main

main:

STMDB R13!, {R0-R7, R14} @ Apo8hkeysh merikwn kataxwrhtwn sto stack

LDR R0, =TABLE_A         @ arxh pinaka A
LDR R1, =TABLE_B         @ arxh pinaka B
LDR	R2, =TABLE_G     @ arxh pinaka G

MOV R3, #4              @ metrhths stoixeiwn (16 bytes / 4)

loop:

LDR R4, [r0], #4        @ R4 = A[i] & R0 += 4
LDR R5, [r1], #4        @	R5 = B[i] &	R1 += 4

ADD R6, R4, R5          @ R6 = A[i] + B[i] 
STR R6, [R2], #4        @ apothikeyei to word toy kataxwrhth R6 sthn thesh mnhmhs poy deixnei o kataxwrhths R2 kai meta ton ayjanoyme 4 theseis 

SUBS R3, R3, #1          @ R3-- & enhmerwse flags CPSR
BNE loop                 @ An R3 != 0 tote synexise sto loop

LDMIA R13!, {R0-R7, PC}  @ epanafora kataxwrhtwn

.data

.align 4                 @ aparaithto dioti ta dedomena prepei na topothetithoyn se dieythunseis poy einai pol/sia toy 4, dioti exoyme words 

TABLE_A:
.byte 32,127,254,57,22,111,48,11,87,45,114,45,66,23,134,168

TABLE_B:
.byte 19,1,18,89,90,112,89,32,23,98,67,83,146,140,200,67

TABLE_G:
.space 16, 0             @ 16 bytes me arxikh timh 0 gia ta apotelesmata