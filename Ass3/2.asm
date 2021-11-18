# ORG 4000h
# ARR: DB 04,05,01,02,03
# LEN EQU 5

# ORG 0000h

MAIN:
  LXI H,ARR
  MVI D,00
  MOV C,LEN
  DCR C
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
  JZ MAIN
  HLT

// CMP M
; If A less than (R/M), the CY flag is set and Zero flag is reset.
; If A equals to (R/M), the Zero flag is set and CY flag is reset.
; If A greater than (R/M), the CY and Zero flag are reset.
