## Data Transfer Instructions

### Immediate Addressing Mode

Here we will handle the data directly. For example: `MVI` (Move Immediate). The `I` in the instruction refers to the data i.e the value to be stored.

### MVI (Move Immediate)
We can load a register with an 8-bits (1 byte) value.
```
MVI <destination>, <8-bit data>
MVI B, 1Eh
```
Here, `B` will now store `1E`

> **NOTE :** M is nothing but where the H-L pair points to.

```
MVI M, 25h
```
This will store `25h` in the memory location pointed by the `H-L` pair.

### LXI (Load Register Pair Immediate)
The instruction loads 16-bit data in the register pair designated in the operand.
Two things to noitce: it has `I` and `X`.
- `I` means it will be immediate addressing
- `X` refers to register pair (extended)

> **P.S :** The register pairs are `B-C`, `D-E`, `H-L (Memory Pointer)`,

```
LXI <destination>, <16-bit data>
LXI B, 2034h
```
Here, `B` will store `20` and `C` will store `34`.

> **P.S :** The H represents Hex Value. The above instruction will store `0x1E` in Register A.

## Register Addressing Mode

### MOV (Move)
Copy the data from one place to another.

```
MOV <reg-dest>, <reg-source>
MOV B, M
```
The contents of `M` will be copied to register `B`.

**Example:**
```
MVI B,25h
MOV C,B
```
1. `0x25` will be stored inside Register B.
2. The contents of B will be copied to C.

So, finally Register C will also have `0x25` value.


### LDA (Load Accumulator)

This instruction copies the data from a given 16 bit address to the accumulator.
*Remember, the 16-bit value won't be stored instead the data which is in the 16-bit address will be stored in the Accumulator*

```
LDA 3000h
```
Content of memory location `3000h` is coppied in accumulator. Let's say there was `10h` in location `3000h`. So, after this instruction `A` will now have `0x10`.

### STA (Store Accumulator)

The content of accumulator is copied into the memory location passed.

```
STA 4000H
```
The content of accumulator is stored into the memory location `4000h`.

**Example: (To move data from 3000h to 4000h**

```
LDA 3000h
STA 4000h
```
1. Load the contents of memory location `3000h` into `A`.
2. Store the contents of `A` into memory location `4000h`.



## **LDAX (Load accumulator indirect)**
Here the register pair point to a memory location. This instruction copies the contents of that memory location into the accumulator. Basically follows indirect addressing.

```
LDAX B
```
The contents of memory location pointed by register pair B is copied in accumulator.


2034H is stored in H-L pair so that it act as memory pointer.

## **LHLD (Load H and L register direct)**
This instruction loads the contents of the 16- bit memory location into the HL register pair.

```
LHLD 3000H
```
The content of location `3000h` is copied into the HL register pair.



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

## **INC (Increment)**
This instruction is used to increment the contents of the operand by one.

## **ANI (And Immediate with Accumulator)**
This instruction is used to AND 8-bit immediate data with the Accumulator’s content. The result of this ANDingoperation will be stored in the Accumulator itself over writing its previous content.

```
ANI Data
```
