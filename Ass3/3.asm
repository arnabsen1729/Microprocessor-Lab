# ORG 1000H
# MYREG EQU 2000H
       MVI A,10    // set A
       LXI B,5092    // set BC
       LXI D,2794    // set DE
       LXI H,3792    // set HL
       SIM    // something with I register
       LXI SP,F001h
       CALL DEBUG
       HLT

DEBUG:
  PUSH H
  PUSH D
  PUSH B
  PUSH PSW
  LXI H,MYREG
  POP D
  CALL STORE    // store AF
  POP D
  CALL STORE    // store BC
  POP D
  CALL STORE    // store DE
  POP D
  CALL STORE    // store HL
  RIM
  MOV M,A    // store I
  INX H
  XCHG    // swap HL and DE
  LXI H,0000
  DAD SP    // now HL <- SP
  XCHG    // now HL-> save addr, DE<- SP
// probem, SP also has this function call stuff, so we need to remove it's info from DE (DE = DE + 2 [remember SP stack works reverse that's why +])
  INX D
  INX D
// now store DE
  CALL STORE
// now we need to store PC, which will be in Stack due to function call
  XCHG    // swap HL and DE to store HL stuff in DE
  XTHL    // get PC data from SP (stack mem has garbage now)
  XCHG    // now HL has save addr, DE has data
  CALL STORE
  XCHG    // PC data back in HL
  XTHL    // PC data back in stack
  XCHG    // save addr back in HL
  RET
// Procedure STORE
// stores data in DE to memory whose address is in HL

STORE:
  MOV M,D
  INX H
  MOV M,E
  INX H
  RET
