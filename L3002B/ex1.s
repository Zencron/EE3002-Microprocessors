	AREA ex1 , CODE , READONLY
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
	
	ADR hPointer , hValues
	ADR xPointer , xValues
	MOV count , #7
	MOV accumulate , #0
	MOV overflow , #0
	LDR output , =0x40000400
	
loop
	LDR hValue , [hPointer] , #4
	LDR xValue , [xPointer] , #4
	MUL multiply , hValue , xValue
	ADDS accumulate , accumulate , multiply ; least significant 32bits of Q49.15
	MOVVS overflow , #1
	SUBS count , count , #1
	BNE loop
	
	MOV r9 , accumulate
	ASR r9 , r9 , #15 ; convert to Q32.0
	STR r9 , [output]
	
stop
	B stop
hValues
	DCD 0xFFFFFBE7 , 0x000004DD , 0x00000625 , 0xFFFFF9DB , 0x00000625 , 0x000004DD , 0xFFFFFBE7
xValues
	DCD 0x0034 , 0x0024 , 0x0012 , 0x0010 , 0x0120 , 0x0142 , 0x0030
		
	END