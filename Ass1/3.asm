      LXI D, E000H
      CALL DELAY
      HLT
DELAY: DCX D
      MOV A, D
      ORA E
      JNZ DELAY
      RET
