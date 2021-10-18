# ORG 2000H
# ARR : DB 2,4,7,9,10
# ORG 0000H
# N EQU 5
# X EQU 8

MVI C, N // Number of elements in the Array
DCR C   // Now we will be using C as the high pointer of Binary Search
MVI B,00 // It is the low pointer of Binary Search
MVI D, X // Number we are looking for
CALL SEARCH
LXI H,ARR
ADD L
MOV L,A
JNC NAD
INR H


NAD:
  MOV A,D
  CMP M
  JZ END
  JC END
  HLT

END:
  CMC // Complement the carry flag
  HLT // Halt

SEARCH:
  MOV A,B
  CMP C  // Checking if low < high
  RNC // Return if not carry
  ADD C // Now acc has B+C
  JNC NOCARRY
  CMC

NOCARRY:
  RAR // Rotate Accumulator right by 1 bit (A = A >> 1) i.e A = (B+C)/2
  MOV E,A
  LXI H,ARR // H-L now has 2000h
  ADD L     // Accumlator now has the offset to the mid point
  MOV L,A   // H-L now points to the mid
  JNC NOPE
  INR H

NOPE:
  MOV A,D // Accumulator now has the number we are looking for
  CMP M   // Compare the number we are looking for with the mid point
  JC LEFT // If less than mid point, go left
  JZ END  // If equal, return
  MOV B,E // E had the previous mid point index
  INR B   // Now looking for [M+1:]
  JMP SEARCH // Rec call search

LEFT:
  MOV C,E
  DCR C
  JNZ SEARCH
  JZ END
  RET

// CMP M
; If A less than (R/M), the CY flag is set and Zero flag is reset.
; If A equals to (R/M), the Zero flag is set and CY flag is reset.
; If A greater than (R/M), the CY and Zero flag are reset.
