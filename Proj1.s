	AREA Prog1 , CODE , READONLY
	ENTRY
	
	MOV r0 , #0x110
	MOV r1 , r0 , LSL #1
	MOV r2 , r1 , LSL #1
	
stop B stop
	END