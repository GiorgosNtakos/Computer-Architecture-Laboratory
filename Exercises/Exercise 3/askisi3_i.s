.arm
.text
.global main

main:
STMDB R13!,{R0-R12,R14}

MOV R0, #94
MOV R1, R0, LSR#1

ADDS R2, R0, R0    @  R2 = R0 + R0 = 94 + 94 = 188 = 0xBC kai den paragei kratoymeno oyte yparxei overflow
ADDS R2, R1, R1    @  R2 = R1 + R1 = 47 + 47 = 94 = 0x5E kai den paragei kratoymeno oyte yparxei overflow
ADDS R2, R0, R1    @  R2 = R0 + R1 = 94 + 47 = 141 = 0x8D kai den paragei kratoymeno oyte yparxei overflow

MOV R0, #0x80000000
ADD R1, R0, #0x80
MOV R2, #1

SUBS R3, R0, R2 @  R3 = R0 - R2 =...=0x7FFFFFFF kai enhmerwnei tis shmaies katastaseis toy CPSR. Blepoyme oti C = 1 dioti den egine kapoio borrow(unsinged: R0 >= R2)(A - B - (1 - C), me C = 1 den xreiasthke daneiko). V = 1 dioti exoyme yperxeilish kai sygkekrimena -> signed: (-) - (+) edwse (+) enw eprepe (-)=> signed overflow   
SUBS R3, R0, R1 @  R3 = R0 - R1 =...=0xFFFFFF80	kai ehmerwnei tis shmaies katastaseis toy CPSR. Blepoyme oti C = 0 dioti h afairesh dhmioyrghse kapoio daneiko (unsigned: R1 >= R0). To N = 1 dioti exoyme MSB = 1 opote prokeitai gia arnhtiko arithmo kai twra V = 0 dioti signed: (-) - (-) (kai signed: R1 >= R0) den kanei overflow ara V = 0 ( idio prosimo) 
RSBS R3, R0, R1 @  R3 = R1 - R0 =...=0x00000080 kai ehmerwnei tis shmaies katastaseis toy CPSR.	Blepoyme oti C = 1 dioti h afairesh den	dhmioyrghse kapoio daneiko(unsigned: R1 >= R0). N = 0 twra dioti exoyme thetiko arithmo MSB = 0 kai V = 0 dioti signed: (-) - (-) (kai signed: R1 >= R0) den kanei overflow ara V = 0 

LDMIA R13!,{R0-R12,PC}

@ Erwthsh: Apokoph dyadikwn psifiwn logw periorismenoy eyroys: Den yparxei apokoph (wrap/truncation) se kamia apo aytes tis prajeis ws unsigned 32-bit, giati kanena apotelesma den jeperna to 32-bit eyros
@ Yparxei omws signed overflow mono sto @19 gi ayto kai V = 1. Exoyme 0x80000000 ws signed einai -2^31 kai -2^31 - 1 poy einai h afairesh den xwraei se signed 32 bit ara emfanizetai overflow.
