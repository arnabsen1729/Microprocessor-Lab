; Storing Z in B-C
; Storing X in D-E
; Storing Y in H-L

# ORG 3000H
# ARR: DB 1, 2, 3, 4

# ORG 0000H
LXI B, 0004 ; count
LXI D, 3000 ; source
LXI H, 4000 ; destination
CALL MOVE
HLT

; Moving 4 bytes from 3000 -> 4000

MOVE:
  LDAX D  ; Stores the content of D-E in A
  MOV M, A ; M -> HL
  INX H
  INX D
  DCX B
  MOV A, B
  ORA C
  JNZ MOVE
  RET

; NOTES:
; 1. We are just using MOV M, A to store the contents of the memory.
; 2. The memory address is 16 bits (2 bytes) but the data is 1 byte.
; 3. This is a standard way do while(counter--){};
; DCX B
; MOV A, B
; ORA C
; JNZ MOVE
