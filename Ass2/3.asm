//Write a function to add two multibyte numbers stored in location X and Y. The result is stored in X. Pass a parameter Z indicating the no. of bytes to be added.

// Manual Data Entry for Y
MVI A,10h;
STA 3000H;
MVI A,10h;
STA 3001H;
MVI A,10h;
STA 3002H;

// Manual Data Entry for X
MVI A,F1h;
STA 4000H;
MVI A,F1h;
STA 4001H;
MVI A,F1h;
STA 4002H;


LXI H,3000H ; Y
LXI D,4000H ; X
MVI B,03h
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
