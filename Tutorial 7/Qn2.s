	AREA Qn2 , CODE , READONLY
	ENTRY
	
pointer RN 0
search RN 1
length RN 2
counter RN 3
value RN 4

	LDR search , =0x9ABCDEF0
	LDR pointer , =table
	LDR length , [pointer] , #4
	MOV counter , #1
loop
	LDR value , [pointer] , #4
	CMP value , search
	BEQ done
	ADD counter , counter , #1
	CMP counter , length
	BNE loop
	STR search , [pointer]
done
stop
	B stop

	AREA data , DATA , READWRITE
table
	DCD 5
	DCD 1 , 2 , 3 , 4
	SPACE 20
	
	END