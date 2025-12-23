.arm
.text
.global main 

main: 
STMDB R13!, {R0-R12, R14} @E0 Apothikeyei toys 13 prwtoys kataxwrthtes kai ton Link Register sto stack alla prwta tha enhmerwsei ton stack pointer 

MOV R0, #0x20             @E1 Metaferei ston kataxwrhth R0 thn dekaejadikh timh 0x20 => R0 = 0x00000020 
MOV R1,R0,LSL #2          @E2 Metaferei ston kataxwrhth R1 to periexomeno toy R0 * 4(olisthisi 2 theseis aristera -> 2^2) => R1 = 0x00000080 
MVN R2,R1,LSL #1          @E3 Metaferei ston kataxwrhth R2 ton antistrofo periexomeno toy R1 olisthimeno kata 1 thesi -> R2 = NOT(R1 * 2) = 0xFFFFFEFF 

LDR R3, =Values           @E4 Bale ston R3 thn dieythynsh ths etiketas Values (R3<-&Values) 
LDR R4, [R3], #4          @E5 Bale ston R4 ta periexomena ths dieythynshs poy einai apothikeymenh ston R3. R4 = 0xCAFEBABA kai tropopoioyme thn dieythynsh poy exei o R3 dhladh -> R3 = R3 + 4 
LDRB R5, [R3], #2         @E6 Bale ston R5 ta periexomena megethoys 1 byte ths dieythynshs poy einai apothikeymenh ston R3. R5 = 0x00000078 kai tropopoioyme thn dieythynsh poy exei o R3 dhladh -> R3 = R3 + 2 
LDRSH R6, [R3], #2        @E7 Bale ston R6 ta eriexomena megethoys 2 byte(halfword) ths dieythynshs poy einai apothikeymenh ston R3 kai epekteine to sta 32 bits me prosthikh 16 bits prosimoy sta MSBs toy(0x82345678 => MSB = 1 ara arnhtikos). R5 = 0xFFFF8234 kai tropopoioyme thn dieythynsh poy exei o R3 dhladh -> R3 = R3 + 2(phge sto epomeno word) 
LDR R3, =Stack            @E8 Bale ston R3 thn thn dieythynsh ths etiketas Values (R3<-&Stack) 
STMIA R3!, {R0-R2, R4-R6} @E9 Tha topothethsei ta periexomena twn R0-R2, R4-R6 jekinontas prwta apo ton R6 kai epeita ayjanontas dieuthhnsh (IA) +4, meta exei seira o R5->R4->R2->R1->R0 kai ayjanetai kai +4 h dieythynsh prospelasis gia kathe prospelasi ths mhnmhs. 
LDMDB R3!, {R0-R2}        @E10 Tha balei ta periexomena ths dieythynshs prospelashs poy exei o R3 afoy thn meiwsei prwta kata R3 - 4*(#R) = R3 - 4*3 stoys kataxwrhtes R0-R2. Epeita write back R3 = R3 - 12 
LDMDB R3!, {R4-R6}        @E11 Tha balei ta periexomena ths dieythynshs prospelashs poy exei o R3 afoy thn meiwsei prwta kata R3 - 4*(#R) = R3 - 4*3 stoys kataxwrhtes R4-R6. Epeita write back R3 = R3 - 12
 
LDMIA R13!, {R0-R12, PC}  @E12 Tha balei ta periexomena poy periexontai sto block mhnmhs jekinontas apo thn dieythinsh poy periexei o R13 stoys kataxwrhtes kai se kathe prospelash tha ayjanei kata 4 => R3 = R3 + 4. Sto telos tha kanei write back thn kainoyrgia dieythinsh ston R3 = R3 + 50 

.data 
Values: 
.word 0xCAFEBABA 
.word 0x82345678 
Stack: 
.word 0,0,0,0 
.word 0,0,0,0