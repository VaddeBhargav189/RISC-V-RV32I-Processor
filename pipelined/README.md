# RV32I 5-Stage Pipelined Processor

A 32-bit RV32I RISC-V processor implemented in Verilog HDL using a **5-stage pipelined architecture**.

This processor extends the single-cycle implementation by dividing instruction execution into multiple stages, allowing several instructions to be processed simultaneously.

The design includes forwarding, hazard detection, pipeline stalling, flushing, and branch handling logic to maintain correct execution in the presence of pipeline hazards.

---

## Architecture

The processor implements the classic 5-stage pipeline:

```text
IF → ID → EX → MEM → WB
```

The five stages are:

```text
IF   - Instruction Fetch
ID   - Instruction Decode and Register Read
EX   - Execute and Address Calculation
MEM  - Data Memory Access
WB   - Register Write Back
```

Pipeline registers separate each stage:

```text
IF → IF/ID → ID → ID/EX → EX → EX/MEM → MEM → MEM/WB → WB
```

This allows multiple instructions to occupy different pipeline stages simultaneously.

---

## Pipeline Stages

### Stage 1 - Instruction Fetch

The Program Counter provides the address of the current instruction to Instruction Memory.

The fetched instruction and required PC information are stored in the **IF/ID pipeline register**.

### Stage 2 - Instruction Decode

The instruction is decoded by the Control Unit and the required source operands are read from the Register File.

The Immediate Generator produces the immediate value required by the instruction.

The generated data and control signals are stored in the **ID/EX pipeline register**.

### Stage 3 - Execute

The ALU performs arithmetic, logical, comparison, and address calculation operations.

The Forwarding Unit selects the correct operand values when dependencies exist between instructions currently in the pipeline.

The execution results and required control signals are stored in the **EX/MEM pipeline register**.

### Stage 4 - Memory Access

Load and store instructions access Data Memory during this stage.

For other instructions, the execution result continues through the pipeline toward the Write Back stage.

The required values are stored in the **MEM/WB pipeline register**.

### Stage 5 - Write Back

The final result is written into the destination register for instructions that require register write-back.

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

## Hazard Handling

Pipelining introduces dependencies between instructions executing simultaneously.

To maintain correct instruction execution, the processor implements:

* Forwarding Unit
* Hazard Detection Unit
* Pipeline Stalling
* Pipeline Flushing
* Branch Handling Logic


## Main Modules

* Program Counter
* Instruction Memory
* Register File
* Control Unit
* Immediate Generator
* ALU
* ALU Controller
* Branch Logic
* Data Memory
* IF/ID Pipeline Register
* ID/EX Pipeline Register
* EX/MEM Pipeline Register
* MEM/WB Pipeline Register
* Hazard Detection Unit
* Forwarding Unit
* Stall Logic
* Flush Logic
* Write Back Unit
* Top Module

---

## Repository Structure

```text
Pipelined_Processor
│
├── Design_Files
│   ├── IF Stage
│   ├── ID Stage
│   ├── EX Stage
│   ├── MEM Stage
│   ├── WB Stage
│   ├── IF_ID Register
│   ├── ID_EX Register
│   ├── EX_MEM Register
│   ├── MEM_WB Register
│   ├── Hazard Detection Unit
│   ├── Forwarding Unit
│   ├── Stall Logic
│   ├── Flush Logic
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

## Pipeline Execution

The pipeline allows several instructions to execute simultaneously in different stages.

For example:

```text
Cycle       1    2    3    4    5    6    7

Instr 1     IF   ID   EX   MEM  WB
Instr 2          IF   ID   EX   MEM  WB
Instr 3               IF   ID   EX   MEM  WB
```

Once the pipeline is filled, the processor can ideally complete approximately one instruction per cycle.

Pipeline stalls and flushes introduce additional cycles when hazards or control-flow changes occur.

---

## Verification

The processor was tested using custom RV32I programs covering:

* Arithmetic Operations
* Logical Operations
* Immediate Operations
* Load/Store Operations
* Branch Instructions
* Jump Instructions
* Data Dependencies
* Forwarding Scenarios
* Load-Use Hazards
* Pipeline Stall Cases
* Pipeline Flush Cases
* Control-Flow Execution

Simulation waveforms are included in the repository to verify correct instruction execution and pipeline behavior.

---

## From Single-Cycle to Pipeline

The original processor executed every instruction completely within a single clock cycle.

The pipelined architecture divides the same instruction execution into five stages:

```text
Single-Cycle:

IF + ID + EX + MEM + WB
          ↓
     One Clock Cycle


Pipelined:

IF → ID → EX → MEM → WB
```

This allows instruction execution to overlap, improving instruction throughput.

However, pipelining introduces additional complexity due to data hazards and control hazards. Forwarding, hazard detection, stalling, and flushing were therefore added to maintain correct execution.

---

## What I Learned

* Verilog HDL
* RTL Design
* RISC-V ISA
* Computer Architecture
* 5-Stage Pipeline Design
* Pipeline Registers
* Instruction-Level Parallelism
* Hazard Detection
* Data Forwarding
* Load-Use Hazard Handling
* Pipeline Stalling
* Pipeline Flushing
* Branch and Jump Handling
* Functional Verification

---

## Future Work

* Instruction Cache
* Data Cache
* Branch Prediction
* RV32M Extension
* Exception Handling

---

Developed as a self-driven project to understand how pipelined processors execute multiple instructions simultaneously and handle data and control hazards.

