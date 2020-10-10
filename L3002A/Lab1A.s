		AREA Exercise1B , CODE , READONLY
		ENTRY
		
		MOV r0 , #10
		MOV r1 , #0
		
Loop	ADD r1 , r1 , #1
		CMP r1 , #10
		ADDNE r0 , r1 , r0
		BNE Loop
		
Stop	B Stop
		END