.arm
.text
.global main

main:

	STMDB R13!, {R14}

	MOV R0, #0x8 @ xarakthristko polyonymo (ametablhto)
	MOV R1, #0xA @ seed (!=0)

	LDR R3, =Results    @ arxikh diey8ynsh apo8hkeyshs
	MOV R2, #20         @ arithmos epanlhpsewn

loop:

	BL LFSR4
	STRB  R1, [R3], #1    @ grapse apotelesma kai phgaine sthn epomenh thesi
	SUBS R2, R2,    #1    @ meiwse metrhth, update flags
	BNE  loop            

	LDMIA R13!, {PC}

@+--------------------------------------------+
@ LFSR4 subroutine (apo to i)				  |
@ R0: polyonymo (menei ametablhto)			  |
@ R1: trexoysa timh -> enhmerwnetai			  |
@+--------------------------------------------+

LFSR4:

	TST   R1, #0x8          @ elegxos MSB(4-bit) = bit3. R1 AND 1000 -> ara an bit3 = 1 tote to apotelesma ths AND = 1000 alliws 0000    
	MOV   R1, R1, LSL #1    @ shift left	    
	AND   R1, R1, #0x0F     @ krata mono ta 4 bits (apotelesma 4 bits)   
	ORRNE R1, R1, #1	@ an bit 3 htan 1, to bazoyme sto LSB alliws den kanoyme tipota
	EORNE R1, R1, R0	@ an bit 3 htan 1, tote XOR me to polyonymo alliws den kanoyme tipota 
	MOV   PC, LR            @ epistrofh
	
.data

Results:
.space 20, 0        @ 20 bytes
           