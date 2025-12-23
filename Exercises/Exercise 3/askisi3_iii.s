.arm
.text
.global main

main:
STMDB R13!,{R0-R4,R14}

LDR R2, =Stor   @ deikths sthn mhnmh poy tha grapsoyme
MOV R3, #5      @ plhthos fibonacci xwris to a0

MOV R0, #1	    @ a0 = 1 (an-2)
MOV R1, #2		@ a1 = 2 (an-1)


STRB  R0, [R2], #1	@ apo8hkeysh a0

@ tha grapsoyme: 1,2,3,5,8,13
@ Synexizoyme me an = a2 (R1)
MOV R4, R1      @ an

loop:

STRB R4, [R2], #1 @ Stor[i] = an, kai R2++

ADD  R4, R1, R0   @ neos an = (neo an-1) + (neo an-2)

@ shift: an-2 <- an-1, an-1 <- an
MOV R0, R1
MOV R1, R4

SUBS R3, R3, #1   @ R3-- & enmhmerwse flags CPSR
BNE loop          @ An R3 != 0 tote synexise loop

LDMIA R13!,{R0-R4,PC}

.data

Stor:
.byte 0,0,0,0,0,0
