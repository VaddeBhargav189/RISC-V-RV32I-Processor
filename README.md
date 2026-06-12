#  RISC-V-RV32I-Processor

A 32-bit RV32I RISC-V processor implemented in Verilog HDL.

This project started as a single-cycle processor and was later extended into a 5-stage pipelined processor with forwarding, hazard detection, stalling, and flushing support.

---

## Project Journey

The processor was developed in multiple stages:

### Stage 1 - Single-Cycle Processor

Implemented and verified:

* Program Counter
* Instruction Memory
* Register File
* Immediate Generator
* ALU
* Data Memory
* Control Unit
* Branch and Jump Support

At this stage, every instruction completed in a single clock cycle.

### Stage 2 - Pipeline Implementation

The design was converted into a 5-stage pipeline:

```text
IF → ID → EX → MEM → WB
```

Pipeline registers added:

```text
IF/ID
ID/EX
EX/MEM
MEM/WB
```

### Stage 3 - Hazard Handling

To execute instructions correctly in a pipeline, the following mechanisms were added:

* Forwarding Unit
* Hazard Detection Unit
* Pipeline Stalling
* Pipeline Flushing
* Branch Handling Logic

---

## Supported Instructions

* R-Type Instructions
* I-Type Instructions
* Load Instructions
* Store Instructions
* Branch Instructions
* JAL
* JALR
* LUI
* AUIPC

---

## Repository Structure

```text
RV32I-Processor
│
├── Single_Cycle_Processor
│   │
│   ├── Design_Files
│   │   ├── Program Counter
│   │   ├── Instruction Memory
│   │   ├── Register File
│   │   ├── Control Unit
│   │   ├── Immediate Generator
│   │   ├── ALU
│   │   ├── Data Memory
│   │   └── Top Module
│   │
│   ├── Test_Bench
│   │
│   ├── Simulation_Results
│   │
│   └── Architecture_Diagrams
│
├── Pipelined_Processor
│   │
│   ├── Design_Files
│   │   ├── IF Stage
│   │   ├── ID Stage
│   │   ├── EX Stage
│   │   ├── MEM Stage
│   │   ├── WB Stage
│   │   ├── IF_ID Register
│   │   ├── ID_EX Register
│   │   ├── EX_MEM Register
│   │   ├── MEM_WB Register
│   │   ├── Hazard Detection Unit
│   │   ├── Forwarding Unit
│   │   ├── Flush Logic
│   │   └── Top Module
│   │
│   ├── Test_Bench
│   │
│   ├── Simulation_Results
│   │
│   └── Architecture_Diagrams
│
└── README.md
```

```


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
* Hazard Detection Unit
* Forwarding Unit
* Pipeline Registers
* Write Back Unit

---

## Verification

The processor was tested using custom RV32I programs covering:

* Arithmetic Operations
* Logical Operations
* Load/Store Operations
* Branch Instructions
* Jump Instructions
* Forwarding Scenarios
* Load-Use Hazards
* Pipeline Stall Cases

Simulation waveforms are included in the repository.

---

## What I Learned

* Verilog HDL
* RTL Design
* RISC-V ISA
* Computer Architecture
* Processor Datapath Design
* Pipeline Design
* Hazard Detection
* Data Forwarding
* Functional Verification

---

## Future Work

* Instruction Cache
* Data Cache
* Branch Prediction
* RV32M Extension
* Exception Handling

---

Developed as a self-driven project to understand how modern processors execute instructions and handle pipeline hazards.
