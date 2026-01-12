# 4-bit Multi-Cycle Processor (Verilog)

This repository contains the design and verification of a **4-bit multi-cycle processor**
implemented in **Verilog HDL**.  
The project demonstrates fundamental **CPU microarchitecture concepts** such as
FSM-based control, registered ALU operation, synchronous memory access, and multi-cycle
instruction execution.

This processor is intended for **educational and learning purposes**.

---

## 🔧 Architecture Overview

The processor consists of the following major blocks:

- **Instruction Decoder (FSM)**  
  Controls instruction execution over multiple clock cycles.
- **4-bit Registered ALU**  
  Supports 16 arithmetic and logical operations with a registered output.
- **16 × 4 Synchronous RAM**  
  Used for operand storage and result write-back.
- **CPU Top Module**  
  Integrates the FSM, ALU, and RAM into a complete processor datapath.

The design follows a **multi-cycle execution model**, where each instruction is completed
over several clock cycles.

---

## 🧾 Instruction Set Architecture (ISA)

### Instruction Format

Each instruction uses a fixed 3-field format:

opcode op1 op2
[3:0] [3:0] [3:0]


- **opcode** : Selects the ALU operation  
- **op1**    : Data memory address (source and destination)  
- **op2**    : Immediate operand / secondary ALU input  

### Instruction Semantics

For every instruction:

MEM[op1] ← ALU( MEM[op1], op2 )


Where:
- `A = MEM[op1]`
- `B = op2`

This is a **memory-operand architecture**.

---

### Supported ALU Instructions

| Opcode | Mnemonic | Operation |
|------|---------|-----------|
| 0000 | PASS | MEM[op1] ← A |
| 0001 | INC | MEM[op1] ← A + 1 |
| 0010 | ADD | MEM[op1] ← A + B |
| 0011 | ADDC | MEM[op1] ← A + B + 1 |
| 0100 | ADDNB | MEM[op1] ← A + ~B |
| 0101 | SUB | MEM[op1] ← A − B |
| 0110 | DEC | MEM[op1] ← A − 1 |
| 0111 | MOV | MEM[op1] ← A |
| 1000 | OR | MEM[op1] ← A OR B |
| 1001 | XOR | MEM[op1] ← A XOR B |
| 1010 | AND | MEM[op1] ← A AND B |
| 1011 | NOT | MEM[op1] ← NOT A |
| 1100 | NAND | MEM[op1] ← A NAND B |
| 1101 | XNOR | MEM[op1] ← A XNOR B |
| 1110 | SHL | MEM[op1] ← A << 1 |
| 1111 | SHR | MEM[op1] ← A >> 1 |

---

## 🔄 FSM-Based Instruction Execution

The processor uses a **finite state machine (FSM)** to control instruction execution.

### FSM States

| State Code | State Name | Function |
|-----------|-----------|----------|
| 000 | INIT | Reset and initialization |
| 001 | FETCH | Read operand from memory |
| 010 | WAIT_RD | Wait for synchronous RAM read |
| 011 | EXECUTE | Apply ALU operation |
| 100 | WAIT_ALU | Wait for registered ALU output |
| 101 | STORE | Write result back to memory |

### Instruction Timing

Each instruction completes in **5 clock cycles**:

FETCH → WAIT_RD → EXECUTE → WAIT_ALU → STORE


This sequencing ensures correct timing with synchronous RAM and a registered ALU.

---

## 🧪 Verification

- A **cycle-accurate testbench** verifies all 16 ALU operations.
- FSM sequencing, ALU timing, and memory write-back are validated using waveform analysis.
- RAM is initialized to zero for simulation purposes.
- One representative waveform demonstrates correct multi-cycle execution.

---

## 📁 Repository Structure

4bit-multicycle-processor/
│
├── rtl/ # RTL source files
├── tb/ # Testbench
├── docs/ # Architecture diagrams and schematics
├── waveforms/ # Simulation waveform screenshot
└── README.md

---

## 🧠 Architectural Notes

- The ALU output is **registered** to align with synchronous RAM write-back.
- Data memory is **fully synchronous** (read and write on clock edge).
- The multi-cycle approach simplifies control logic and avoids timing hazards.

---

## 🛠 Tools Used

- Verilog HDL
- Vivado (RTL elaboration and simulation)
- Behavioral simulation with waveform inspection

---

## 📌 Scope and Limitations

- No program counter or instruction memory is included.
- Instructions are supplied externally (via testbench).
- The design focuses on **datapath and control concepts**, not full CPU features.

---

## 📜 License

This project is released under the **MIT License** and is free for academic and educational use.
....