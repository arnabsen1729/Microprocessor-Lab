	   LXI H,4200
	   MOV B,M	// number of elements
	   INX H	// increement memory pointer
	   MOV D,M	// storing the min in D
	   MOV C,M	// storing the max in C
	   DCR B

LOOP:	   INX H
	   MOV A,M
	   CMP D
	   JNC MAX
	   MOV D,M

MAX:	   CMP C
	   JC AHEAD
	   MOV C,A

AHEAD:	   DCR B
	   JNZ LOOP
	   MOV A,D
	   STA 4300
	   MOV A,C
	   STA 4400
	   HLT
