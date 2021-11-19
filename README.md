# Microprocessor

[**FINAL REPORT**](./Report/toc.md)

Microprocessor is a central processing unit on a single intergrated circuit containing millions of very small components including transistors, resistors and diodes.

Name | Word Length | Addressing Cap | Number of Pins
---|---|---|---
4004 | 4-bit | 640 bytes | 16
8008 | 8-bit | 16k bytes | 28
8080 | 8-bit | 64k bytes | 40
8085 | 8-bit | 64k bytes | 40
8086 | 16-bit | 1m bytes | 40

> **Remember**: 1 nibble = 4 bits and 1 byte = 8 bits.

## Architecture of 8085

[Link](https://www.tutorialspoint.com/microprocessor/microprocessor_8085_architecture.htm)

Every instruction given to the MP is stored in a *Instruction Register*, which then goes to the *Instruction Decoder*. The execution of the instruction will be taken care by the control unit.

The registers are used to store the values of the operands and the result of the instruction. We have a *Register Array*, *Accumulator* and *Flag Register*.

Accumulator (ACC) is 8 bits. Flag register is also 8 bits but generally only 5 bits are used.

There are 6 general purpose registers in 8085 processor, i.e. B, C, D, E, H & L. Each register can hold 8-bit data.

These registers can work in pair to hold 16-bit data and their pairing combination is like B-C, D-E & H-L.

### Flag Register

D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0
---|---|---|---|---|---|---|---
S | Z | X | AC | X | P | X | CY

It is an 8-bit register having five 1-bit flip-flops, which holds either 0 or 1 depending upon the result stored in the accumulator.

These are the set of 5 flip-flops −
- Sign (S)
- Zero (Z)
- Auxiliary Carry (AC)
- Parity (P)
- Carry (C)

- Sign Flag is 1, if the MSB of ALU is 1.
- Zero Flag is 1, if the ALU result is 0.
- Parity Flay is 1, if the number of 1s in the ALU result is even.
- Auxiliary Carry Flag is 1, if there is a carry from lower to upper nibble / borrow from upper to lower nibble. Only the computer can access this for BCD addition and other puposes.
