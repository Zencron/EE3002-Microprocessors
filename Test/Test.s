		AREA test , CODE
		ENTRY
		
		ADR r0 , values
		MOV r1 , #50
		
loop	LDR r2 , [r0] , #4
		CMP r3 , r2
		MOVLT r3 , r2
		SUBS r1 , r1 , #1
		BNE loop		
		
stop	B stop

values	DCD 1,1,2,1,1,1,1,1,1,1
		DCD 1,1,1,3,1,1,1,1,1,1
		DCD 1,1,1,1,4,1,1,1,1,1
		DCD 1,1,1,1,1,5,1,1,1,1
		DCD 1,1,1,1,1,1,6,1,1,9,66
		
		END
	
		
	//Tutorial 5 Qn 1
	//MOV r7 , #0x8C , 4
	//MOV r7 , #0x42 , 30
	//MVN r7 , #2
	//MVN r7 , #0x8C , 4