// Assuming 8004 is faulty
LXI H,8004
MVI M,01
// Checking from 805 till 5 bytes
LXI H,8000
MVI B,05
CALL CHECK
HLT

CHECK:
    MOV A,M
    ANI 01       // Doing ANDImmediate with 01
    JNZ FAULTY   // If Z is set
    INX H
    DCR B
    JNZ CHECK
    CMC
    STC
    RET

FAULTY:
    STC    // set Cy 1
    RET
