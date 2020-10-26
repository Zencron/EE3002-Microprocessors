	AREA Qn2 , CODE , READONLY
	ENTRY
	
	
	
	
	
	
nFactorial
	
	
myPUSH
	STR r0 , [sp , #-4]!
	BX lr

myPOP
	LDR r0 , [sp] , #4
	BX lr
	
	
	
	END