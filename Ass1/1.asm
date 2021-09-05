	   LXI H,0000	// Load H-L pair with 0000H, it will be used as an accumulator
	   MVI D,1E	// Move immediate data to register, D storing 0x1E = 30
	   MVI C,01	// B-C pair storing 00-01

L1:	   DAD B	// Double ADd
	   INX B	// INcrementeXtended register, increments B-C
	   DCR D	// DeCRement, decrements D
	   JNZ L1	// Jump Not Zero
	   SHLD 8085	// Store HLpair using Direct addressing, storing the data in 8085
	   HLT	// Halt
