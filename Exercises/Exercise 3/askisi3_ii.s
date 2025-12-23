.arm
.text
.global main

main:
STMDB R13!,{R0-R3,R14}

MOV R0, #0      @ timh poy tha grafoyme
LDR R1, =Stor   @ deikths sthn mhnmh poy tha grapsoyme
MOV R2, #6      @ plhthos bytes

loop:

STRB R0, [R1], #1 @ Stor[i] = R0, kai R1++
ADD  R0, R0, #1   @ epomenos arithmos

SUBS R2, R2, #1   @ R2-- & enmhmerwse flags CPSR
BNE loop          @ An R2 != 0 tote synexise loop

LDMIA R13!,{R0-R2,PC}

.data

Stor:
.byte 0,0,0,0,0,0
