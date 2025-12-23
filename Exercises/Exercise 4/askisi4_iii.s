.arm
.text
.global main

main:

STMDB R13!, {R1-R6, R14}

LDR R1, =Values  @ Deikths sto x
LDR R6, =Results @ Deikths apothikeyshs apotelesmatwn

@ --------- x0 ---------
LDR R0, [R1], #4 @ R0 = x0
BL Poly6_Horner
STR R0, [R6], #4

@ --------- x1 ---------
LDR R0, [R1], #4
BL Poly6_Horner
STR R0, [R6], #4

@ --------- x2 ---------
LDR R0, [R1], #4
BL Poly6_Horner
STR R0, [R6], #4

@ --------- x3 ---------
LDR R0, [R1], #4
BL Poly6_Horner
STR R0, [R6], #4

LDMIA R13!, {R1-R6, PC}

@-------------------------------------------------------------------+
@ Poly6_Horner													    |
@ Ypologizei to P(x) = a0 + a1*x +...+ a6*x^6 me thn methodo horner |
@ b6 = a6															|
@ b_{i-1} = b_i*x + a_{i-1} gia i = 6...1                           |
@ Eisodos: R0 = x													|
@ Ejodos:  R0 = P(x)												|
@ Syntelestes: Const[0] = a0 ... Const[6] = a6						|
@-------------------------------------------------------------------+

Poly6_Horner:
STMDB R13!, {R1-R4}

MOV R4, R0     @ R4 = x

LDR R1, =Const @ R1 -> a0
ADD R1, R1, #6 @ R1 -> a6

LDRB R0, [R1]  @ R0 = b = a6

MOV R2, #6     @ 6 bhmata goa a5...a0

horner_loop:
SUB  R1, R1, #1     @ pame ston epomeno syntelesth pros ta katw
LDRB R3, [R1]       @ R3 = a_{i-1}
MLA  R0, R0, R4, R3 @ b = b*x + a_{i-1}

SUBS R2, R2, #1
BNE horner_loop

LDMIA R13!, {R1-R4}
MOV PC, LR  
  
.data

Values:
@	   x
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80Ab

Const:
@	   a0	 a1	   a2
.byte 0x04, 0x07, 0x05
@ 	   a3	 a4	   a5	 a6
.byte 0x20, 0x1A, 0x12, 0x06

.align 4

Results:
.space 16,0 @ 4 words
