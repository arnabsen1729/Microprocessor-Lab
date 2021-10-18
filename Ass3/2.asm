MVI A,95	// Values are stored
STA 2041
MVI A,85
STA 2042
MVI A,F5
STA 2043
MVI A,5A
STA 2044
MVI A,01
STA 2045
// Main logic starts

START:
  LXI H,2041
  MVI D,00
  MOV C,05
  DCR C
  INX H

CHECK:
  MOV A,M
  INX H
  CMP M
  JC NEXTBYTE
  JZ NEXTBYTE
  CALL SWAP
SWAP:
  MOV B,M
  MOV M,A
  DCX H
  MOV M,B
  INX H
  MVI D,01

NEXTBYTE:
  DCR C
  JNZ CHECK
  MOV A,D
  CPI 01
  JZ START
  HLT

// CMP M
; If A less than (R/M), the CY flag is set and Zero flag is reset.
; If A equals to (R/M), the Zero flag is set and CY flag is reset.
; If A greater than (R/M), the CY and Zero flag are reset.
