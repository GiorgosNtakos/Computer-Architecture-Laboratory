.arm
.text
.global main

main:

	STMDB R13!, {R14}

	LDR R0, =0x10424200 @ xarakthristko polyonymo (ametablhto)
	LDR R1, =0xCAFEBABA @ seed (!=0)

	LDR R3, =Results    @ arxikh diey8ynsh apo8hkeyshs
	MOV R2, #20         @ arithmos epanlhpsewn

loop:

	BL LFSR
	STR  R1, [R3], #4   @ grapse apotelesma kai phgaine sthn epomenh thesi
	SUBS R2, R2,  #1    @ meiwse metrhth, update flags
	BNE  loop            

	LDMIA R13!, {PC}

@+--------------------------------------------+
@ LFSR subroutine (apo to i)				  |
@ R0: polyonymo (menei ametablhto)			  |
@ R1: trexoysa timh -> enhmerwnetai			  |
@+--------------------------------------------+

LFSR:

	MOVS  R1, R1, LSL #1   @ shift left, MSB -> C
	ADC  R1,  R1,      #0  @ bazoyme to carry sto LSB
	EOR  R1,  R1,      R0  @ XOR me polyonymo
	MOV  PC,  LR           @ epistrofh
	
.data
.align 4

Results:
.space 80, 0        @ 20 words * 4 bytes = 80 bytes
           