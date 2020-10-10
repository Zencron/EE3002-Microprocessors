					AREA Exercise2 , CODE , READONLY
					ENTRY
counter 			RN 0
celsius				RN 1
fahrenheit			RN 2
celsiusValues 		RN 3
fahrenheitValues	RN 4
multiply			RN 5
plus				RN 6

					MOV counter , #10
					ADR celsiusValues , CelsiusTable
					LDR fahrenheitValues , =0x40000100
					LDR multiply , =0x0000E666 ;Q17.15
					LDR plus , =0x00100000 ;Q17.15

Loop				LDR celsius , [celsiusValues] , #4
					MUL fahrenheit , celsius , multiply ; multiples by 1.8 , saves in Q41.23 format but excludes first 32 bits (Q9.23)
					LSR fahrenheit , fahrenheit , #8 ; converts to Q17.15 format
					ADD fahrenheit , fahrenheit , plus ; adds 32, saves in Q17.15 format
					LSR fahrenheit , #7 ; converts to Q24.8 format
					STR fahrenheit , [fahrenheitValues] , #4
					SUBS counter , counter , #1
					BNE Loop

Stop				B Stop
CelsiusTable		DCD 0x00001080 , 0x0000119A , 0x000012E6 , 0x0000141A , 0x00001680 , 0x00001AB3 , 0x00001CE6 , 0x0000239A , 0x00002433 , 0x0000259A

					END