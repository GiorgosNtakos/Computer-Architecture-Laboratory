.arm
.text
.global main

main:

STMDB R13!, {R1-R7, R14}

LDR R6, =Results @ fortonoyme ton R6 me thn dieuthinsi poy deixnei to Results

@++++++++++++++++++++++++++
@ Set 0 (i=0): Values + 0 |
@++++++++++++++++++++++++++

LDR R0, =Values	  @	fortonoyme ton R0 me thn dieuthinsi poy deixnei to Values
BL  Subrtn        @ Diakladosi sthn etiketa Subrtn kai apothikeysh toy torinoy PC(prin thn diakladwsh) ston LR
MOV R7, R0        @ max = result[0]
MOV R5, #0        @ idx = 0
STR R0, [R6], #4  @ Apothikeysh toy apotelesmatos apo thn Subrtn sthn thesi mhnmhs poy deixnei o R6 kai meta R6 += 4

@++++++++++++++++++++++++++
@ Set 0 (i=0): Values + 3 |
@++++++++++++++++++++++++++

LDR R0, =Values
ADD R0, R0, #3   @ Etsi pernoyme to epomeno se seira set metablhtwn
BL  Subrtn
STR R0, [R6], #4

CMP R0, R7        @ An R0 > max (signed)
MOVGT R7, R0      @ max = R0 a
MOVGT R5, #1      @ idx = 1

@++++++++++++++++++++++++++
@ Set 0 (i=0): Values + 6 |
@++++++++++++++++++++++++++

LDR R0, =Values
ADD R0, R0, #6
BL  Subrtn
STR R0, [R6], #4

CMP R0, R7        @ An R0 > max (signed)
MOVGT R7, R0      @ max = R0 
MOVGT R5, #2      @ idx = 2

@++++++++++++++++++++++++++
@ Set 0 (i=0): Values + 9 |
@++++++++++++++++++++++++++

LDR R0, =Values
ADD R0, R0, #9
BL  Subrtn
STR R0, [R6], #4

CMP R0, R7        @ An R0 > max (signed)
MOVGT R7, R0      @ max = R0 
MOVGT R5, #3      @ idx = 3

@ --- Grafoyme max & idx sto Const+4 Const+5 ---
LDR R1, =Const
STRB R7, [R1, #4] @ Const + 4 = max (LSB byte)
STRB R5, [R1, #5] @ Const + 5 = index (0...3)

LDMIA R13!, {R1-R7, PC}

Subrtn:

@ (1) Prwta Swzomai toys kataxwrhtes poy tha "lerwsoyme"
STMDB R13!, {R1-R6}

@ (2) Fortonoyme ta a, b, c stoys R1-R3(signed byte)
LDRSB R1, [R0, #0] @ ai
LDRSB R2, [R0, #1] @ bi
LDRSB R3, [R0, #2] @ ci

@ Twra Fortonoyme ta z0, z1, z2, stoys R4,R5,R6 me prosoxh omws dioti R4 = &Const opote ton enhmerwnoyme teleytaio
LDR R4, =Const
LDRSB R5, [R4, #1] @ z1
LDRSB R6, [R4, #2] @ z2
LDRSB R4, [R4, #0] @ z0

@ (3) inner = a*z0 + b*z1 - c*z2
MUL R0, R1, R4     @ R0 = a*z0
MLA R0, R2, R5, R0 @ R0 = a*z0 + b*z1
MUL R1, R3, R6     @ R1 = c*z2
SUB R0, R0, R1     @ R0 = inner

@ num = 5*inner
ADD R0, R0, R0, LSL #2

@ x = num/64 (signed)
MOV R0,R0, ASR #6

@ (4) epanafora & epistrofh
LDMIA R13!, {R1-R6}
MOV PC, LR   



.data

Values:
@	   a	  b		c
.byte 0x02, 0x03, 0x04
.byte 0x10, 0x05, 0x06
.byte 0x0B, 0x02, 0x0D
.byte 0x01, 0x0C, 0x08

Const:
@	   z0	 z1	   z2	pad	   max	idx
.byte 0x04, 0x07, 0x05, 0x00, 0x00, 0x00

.align 4

Results:
.space 16,0 @ 4 words
