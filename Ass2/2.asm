       LXI H,7000
       CALL ISODD
       HLT

ISODD:       MOV A,M
       ANI 01
       JNZ ODD
       MVI M,00
       RET

ODD:       MVI M,01
       RET
