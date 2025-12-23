.arm
.text
.global main

main:

	 STMDB R13!, {R1-R7}

	 LDR R0, =Table @ base adrres
	 MOV R1, #20    @ N = 20 bytes

	 BL Sort_InPlace_Byte @ tajinomhsh in-place

	 @ elegxos orthothtas
	 LDR R0, =Table
	 MOV R1, #20
	 BL CheckSorted_Byte @ R0 = 0 -> OK, R0 = 1 -> FAIL. R1 = index an FAIL

stop:

	B stop               @ bohthiko gia dw toys register ston debugger

@+---------------------------------------------+
@ Sor_Inplace_Byte			       |
@ R0 = base adress			       |
@ R1 = N (number of elements in bytes)	       |
@+---------------------------------------------+

Sort_InPlace_Byte:
	
	STMDB R13!, {R2-R7}

	MOV R6, R0 @ base
	MOV	R7, R1 @ N

	MOV R1, #0 @ i = 0

outer_loop:
	
	SUB R5, R7, #1
	CMP R1, R5
	BHS sort_done

	ADD R3, R1, #1
	LDRB R0, [R6, R1] @ min = A[i]
	MOV R2,R1         @ min_pos = i

inner_loop:

	CMP R3, R7
	BHS do_swap

	LDRB R4, [R6, R3] @ val = A[j]
	CMP  R0, R4       @ if (min > val)	unsigned
	MOVHI R0, R4      @ min = val
	MOVHI R2, R3      @ min_pos = j

	ADD R3, R3, #1
	B inner_loop

do_swap:

	LDRB R5, [R6, R1] @ temp = A[i]
	STRB R0, [R6, R1] @ A[i] = min
	STRB R5, [R6, R2] @ A[min_pos] = old A[i]

	ADD R1, R1, #1
	B outer_loop

sort_done:

	LDMIA R13!, {R2-R7}
	MOV PC, LR

@+--------------------------------------------------------+
@ CheckSorted_Byte					  |
@ Elegxei an A[0...N-1] einai mh-fthinwn (unsigned bytes) |
@ R0 = base, R1 = N				          |
@ Epistrefei:						  |
@ R0 = 0 an OK                                            |
@ R0 = 1 an FAIL					  |
@ R1 = index i opoy brethike A[i] > A[i+1]		  |
@+--------------------------------------------------------+

CheckSorted_Byte:

	STMDB R13!, {R2-R5}

	MOV R4, R0 @ base
	MOV R5, R1 @ N

	CMP R5, #1
	BLE ok     @ N <= 1

	MOV R1, #0 @ i = 0

check_loop:

	LDRB R2, [R4, R1] @ cur = A[i]
	ADD  R3, R1, #1
	LDRB R3, [R4, R3] @ next = A[i+1]

	CMP R3, R2        @ compare next vs cur (unsigned)
	BLO fail          @ if next < cur => FAIL

	ADD R1, R1, #1
	SUB R0, R5, #1
	CMP R1, R0
	BLT check_loop

ok:

	MOV R0, #0      @ OK
	LDMIA R13!, {R2-R5}
	MOV PC, LR

fail:
 
	MOV R0, #1      @ FAIL
	@ R1 einai hdh to index i opoy A[i] > A[i+1]
	LDMIA R13!, {R2-R5}
	MOV PC, LR

.data

Table:
.byte 0x45, 0x82, 0x34, 0xDA, 0x10, 0x28, 0x5C, 0x01, 0x9A, 0x6F
.byte 0x00, 0xFF, 0x13, 0x7D, 0x2B, 0xB0, 0x4E, 0x19, 0xA1, 0x3C
