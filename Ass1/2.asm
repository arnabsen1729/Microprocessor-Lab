# ORG 4200H
# ARR: DB 9, 1, 8, 4, 8, A, F, 5
# LEN EQU 08
# ORG 0000H
	LXI H,ARR
	MVI B,LEN ; number of elements
	MOV D,M	 ; storing the min in D
	MOV C,M	 ; storing the max in C
	DCR B

LOOP:
	INX H
	MOV A,M
	CMP D
	JNC MAX
	MOV D,M

MAX:
	CMP C
	JC AHEAD
	MOV C,A

AHEAD:
	DCR B
	JNZ LOOP
	MOV A,D
	STA 4300
	MOV A,C
	STA 4400
	HLT
