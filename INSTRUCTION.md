## **MOV (Move)**
Copy the data from one place to another.
Usage:  `MOV Rd, Rs` (This instruction copies the content of Rs to Rd)

```
MOV Rd, M
```

The contents of M will be copied to register Rd.

## **MVI (Move Immediate)**
We can load a register with an 8-bits value.

```
MVI   A, 1EH
```
The H represents Hex Value. The above instruction will store `0x1E` in Register A.

## **LDA (Load accumulator)**
This instruction copies the data from a given 16 bit address to the accumulator

```
LDA 3000H
```
Content of memory location `3000h` is coppied in accumulator.

## **LDAX (Load accumulator indirect)**
Here the register pair point to a memory location. This instruction copies the contents of that memory location into the accumulator. Basically follows indirect addressing.

```
LDAX B
```
The contents of memory location pointed by register pair B is copied in accumulator.

## **LXI (Load register pair immediate)**
The instruction loads 16-bit data in the register pair designated in the operand.

```
LXI H, 2034H
```
2034H is stored in H-L pair so that it act as memory pointer.

## **LHLD (Load H and L register direct)**
This instruction loads the contents of the 16- bit memory location into the HL register pair.

```
LHLD 3000H
```
The content of location `3000h` is copied into the HL register pair.

## **STA (Store Accumulator)**
The content of accumulator are copied into the memory location.

```
STA 3000H
```
The content of accumulator is stored into the memory location `3000h`.

## **STAX (Store Accumulator Indirect)**
The contents of the accumulator are copied into the memory location specified by the contents of the operand (register pair). The contents of the accumulator are not altered.

```
STAX B
```
The content of accumulator is stored into the memory location specified by the BC register pair.

## **SHLD (Store H and L register direct)**
The contents of register L are stored into the memory location specified by the 16-bit address in the operand and the contents of H register are stored into the next memory location by incrementing the operand. The contents of registers HL are not altered. This is a 3-byte instruction, the second byte specifies the low-order address and the third byte specifies the high-order address.

```
SHLD 3000H
```

## **ADD (Add)**
Add contents of register to Accumulator.

```
ADD A
```

The contents of A will be added to the accumulator i.e `ACC += (*A)`.

## **ORA (OR Accumulator)**
This instruction is used to OR contents of R with the Accumulator. The result of OR operation will be stored back in the Accumulator.
