# RV32I Single-Cycle Processor

A 32-bit RV32I RISC-V processor implemented in Verilog HDL using a **single-cycle architecture**.

This processor is the first implementation of the RISC-V RV32I Processor project. It implements the complete datapath and control logic required to execute supported RV32I instructions within a single clock cycle.

---

## Architecture

The processor follows a single-cycle architecture where every instruction completes its execution in one clock cycle.

Instruction execution follows:

```text
Instruction Fetch → Decode → Execute → Memory Access → Write Back
```

The processor contains separate modules for instruction fetch, instruction decoding, register access, immediate generation, ALU operations, memory access, branch and jump handling, and register write-back.

Since the complete instruction execution occurs within one cycle, the clock period is determined by the longest combinational path through the processor.

---

## Supported Instructions

The processor supports:

* R-Type Instructions
* I-Type Instructions
* Load Instructions
* Store Instructions
* Branch Instructions
* JAL
* JALR
* LUI
* AUIPC

These instructions cover the major arithmetic, logical, memory access, immediate, branch, and jump operations of the RV32I base integer instruction set.

---

## Main Modules

* Program Counter
* Instruction Memory
* Register File
* Control Unit
* Immediate Generator
* ALU
* ALU Controller
* Branch and Jump Logic
* Data Memory
* Write Back Logic
* Top Module

---

## Repository Structure

```text
Single_Cycle_Processor
│
├── Design_Files
│   ├── Program Counter
│   ├── Instruction Memory
│   ├── Register File
│   ├── Control Unit
│   ├── Immediate Generator
│   ├── ALU
│   ├── ALU Controller
│   ├── Branch and Jump Logic
│   ├── Data Memory
│   └── Top Module
│
├── Test_Bench
│
├── Simulation_Results
│
├── Architecture_Diagrams
│
└── README.md
```

---

## Instruction Execution

The Program Counter provides the address of the instruction to Instruction Memory.

The fetched instruction is decoded by the Control Unit, while the Register File provides the required source operands. The Immediate Generator generates the immediate value required for instructions using immediate operands.

The ALU performs arithmetic, logical, comparison, and address calculation operations. Load and store instructions access Data Memory, while branch and jump instructions use the control-flow logic to determine the next Program Counter value.

For instructions that produce a register result, the final value is written back to the destination register.

All these operations are completed within a single clock cycle.

---

## Verification

The processor was tested using custom RV32I programs covering:

* Arithmetic Operations
* Logical Operations
* Immediate Operations
* Load/Store Operations
* Branch Instructions
* Jump Instructions
* Register Write-Back
* Memory Access
* Control-Flow Execution

Simulation waveforms are included in the repository to verify correct instruction execution and processor behavior.

---

## Design Characteristics

The single-cycle architecture provides simple and predictable instruction execution.

Every instruction completes in exactly one clock cycle:

```text
CPI = 1
```

However, the clock period must be long enough for the slowest instruction to propagate through the complete datapath.

Therefore, the architecture provides simple control and fixed CPI, while the maximum operating frequency is limited by the longest combinational path.

---

## What I Learned

* Verilog HDL
* RTL Design
* RISC-V ISA
* Computer Architecture
* Processor Datapath Design
* Control Unit Design
* ALU and Register File Design
* Memory Access Logic
* Branch and Jump Handling
* Functional Verification

---

Developed as a self-driven project to understand the fundamental datapath, control logic, and instruction execution of a RISC-V processor.


