; Write a fast sub-routine to multiply 9 by 15

LXI H,0000H
MVI E,0FH
MVI B,09H
LOOP:
  DAD D ; HL <- HL + DE
  DCR B ; Decrease B (1-byte)
  JNZ LOOP
HLT
