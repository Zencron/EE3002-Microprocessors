		AREA Tutorial7 , CODE , READONLY
		ENTRY
		
memory	RN 0
count RN 4
		MOV memory , #0x40000000
		MOV count , #18
		MOV r1 , #0
		STR r1 , [memory] , #4
		MOV r1 , #1
		STR r1 , [memory] , #4
		
fibo	LDR r1 , [memory , #-8]
		LDR r2 , [memory , #-4]
		ADD r3 , r1 , r2
		STR r3 , [memory] , #4
		SUBS count , count , #1
		BNE fibo

stop	B stop
		END