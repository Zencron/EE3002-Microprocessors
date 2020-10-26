	AREA Qn4 , CODE , READONLY
	ENTRY
	
	ADR r0 , list
	MOV r1 , #0
	LDR sp , =0x40000000
	BL add4
stop
	B stop
	

add4
	STMEA sp! , {lr}
	MOV r2 , #0
	MOV r4 , #3
loop
	LDR r3 , [r0 , r4 , LSL #2]
	BL square
	ADD r1 , r1 , r2
	SUBS r4 , r4 , #1
	BPL loop
	LDMEA sp! , {pc}	

square
	MUL r2 , r3 , r3
	BX lr

list
	DCD 1 , 2 , 3 , 4

	END