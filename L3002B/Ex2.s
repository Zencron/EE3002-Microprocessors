	AREA Ex2 , CODE , READONLY
	ENTRY
	
hPointer RN 0
xPointer RN 1
hValue RN 2
xValue RN 3
multiply RN 4
accumulate RN 5
count RN 6
overflow RN 7
output RN 8
	
	LDR hPointer , =0x40000200
	LDR xPointer , =0x40000300
	LDR sp , =0x40000100
	LDR output , =0x40000400
	
	LDR r11 , =0xFFFFFBE7
	STR r11 , [hPointer] , #4
	LDR r11 , =0x000004DD
	STR r11 , [hPointer] , #4
	LDR r11 , =0x00000625
	STR r11 , [hPointer] , #4
	LDR r11 , =0xFFFFF9DB
	STR r11 , [hPointer] , #4
	LDR r11 , =0x00000625
	STR r11 , [hPointer] , #4
	LDR r11 , =0x000004DD
	STR r11 , [hPointer] , #4
	LDR r11 , =0xFFFFFBE7
	STR r11 , [hPointer] , #4
	
	LDR r11 , =0x0034
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0024
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0012
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0010
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0120
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0142
	STR r11 , [xPointer] , #4
	LDR r11 , =0x0030
	STR r11 , [xPointer] , #4
	
	LDR hPointer , =0x40000200
	LDR xPointer , =0x40000300
	MOV count , #7
	MOV accumulate , #0
	
	STMFD sp! , {hPointer , xPointer , count , accumulate}
	BL calculate
	ASR accumulate , accumulate , #15
	STR accumulate , [output]
stop
	B stop
	
	
calculate
	LDMFD sp! , {hPointer , xPointer , count , accumulate}
loop
	LDR hValue , [hPointer] , #4
	LDR xValue , [xPointer] , #4
	MUL multiply , hValue , xValue
	ADDS accumulate , accumulate , multiply ; least significant 32bits of Q49.15
	MOVVS overflow , #1
	SUBS count , count , #1
	BNE loop
	BX lr
	
	END