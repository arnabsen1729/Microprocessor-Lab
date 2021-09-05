	   LXI H,4200
	   MOV B,M
	   INX H
	   MOV A,M
	   DCR B

LOOP:	   INX H
	   CMP M
	   JNC AHEAD
	   MOV A,M

AHEAD:	   DCR B
	   JNZ LOOP
	   STA 4300
	   HLT
