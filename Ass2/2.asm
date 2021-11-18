# NUM EQU 7
MVI A, NUM
CALL ISODD
HLT

// Will store 1 in register B if odd, else 0.
ISODD:
  ANI 01    ; AND Immediate with the data and store the result in Acc
  MOV B,A
  RET
