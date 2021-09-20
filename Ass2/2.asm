; Write a function isODD(unsigned n) in assembly that takes an unsigned integer (a byte) and determines if it is odd (returns 1) or 0 if it is even.
LDA 3000h   ; copies the data from 3000h to accumulator, takes input
LXI H, 4000 ; store the result
CALL ISODD
HLT

// Will store 1 in Memory if odd, else 0.
ISODD:
  ANI 01    ; AND Immediate with the data and store the result in Acc
  JZ EVEN   ; If Zero flag is set i.e the number if even
  MVI M, 01 ; Else store 1 in the Memory
  RET
EVEN:
  MVI M, 00 ; If even store 0 in the Memory
  RET
