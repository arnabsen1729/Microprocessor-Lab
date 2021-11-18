# ORG 3000h
# ARR: DB 01,02,03,04

# ORG 4000h
# ARR: DB 05,06,07,08

# LEN EQU 04

# ORG 0000h
LXI H,3000H ; Y
LXI D,4000H ; X
MVI B, LEN  ; Z
CALL SUM
HLT

SUM:
  LDAX D ;copies the contents of that memory location D-E into the accumulator
  ADC M  ;ADd with Carry
  STAX D ;contents of the A are copied into the memory location
  INX D
  INX H
  DCR B
  JNZ SUM
  JC CARRY ;If there is some left out carry
  RET

CARRY:
  MVI A, 01h
  STAX D
  RET
