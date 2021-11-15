# ORG 0000H
    MVI A,0B // To enable R7.5
    SIM // Set Interrupt Mask
    EI  // Enables Interrupt

LOOP:
    MVI A,01
    JNZ LOOP

# ORG 3C
    DI
    INX D
    CALL DEL80 // Adding some delay
    EI
    RET

DEL80:	   LXI B,28AF

DEL80LOOP:
    DCX B
    MOV A,B
    ORA C
    JNZ DEL80LOOP
    RET
