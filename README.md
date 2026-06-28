# MIPS Single-Cycle Processor

A modular Verilog HDL implementation of a **Single-Cycle MIPS Processor** based on the architecture presented in **Computer Organization and Design** by David A. Patterson and John L. Hennessy.

This project was developed entirely from scratch, including the datapath modules, control logic, memory units, verification environment, and simulation.

---

# Overview

This project implements a classical **Single-Cycle MIPS Processor** capable of executing a subset of MIPS R-Type, I-Type and J-Type instructions.

The processor architecture follows the standard single-cycle datapath presented in Patterson & Hennessy's textbook and is organized as a fully modular Verilog design.

The design has been simulated and verified using **ModelSim**.

---

# Processor Architecture

The processor is composed of independent hardware modules, making the design easy to understand, maintain and extend.

Main modules include:

* Program Counter (PC)
* Instruction Memory
* Data Memory
* Register File
* Arithmetic Logic Unit (ALU)
* ALU Control Unit
* Main Control Unit
* Sign Extension Unit
* Instruction Parser
* Top-Level Processor Module

## Datapath

> <img width="715" height="389" alt="Datapath" src="https://github.com/user-attachments/assets/091250a5-6af8-4da2-9002-348a7da362fe" />





```markdown
![MIPS Datapath](docs/datapath.png)
```

---

# Supported Instructions

## R-Type

* add
* sub
* and
* or
* xor

## I-Type

* addi
* andi
* ori
* lw
* sw
* beq
* bne

## J-Type

* j

---

# Project Structure

```text
MIPS-Single-Cycle-Processor
│
├── src
│   ├── ALU.v
│   ├── ALU_control_unit.v
│   ├── control_unit.v
│   ├── data_memory.v
│   ├── extension.v
│   ├── inst_memory.v
│   ├── InstructionParser.v
│   ├── PC.v
│   ├── reg_file.v
│   └── core
.v
│
├── testbench
│   └── testbench.v
│
├── docs
│   ├── datapath.png
│   └── simulation_waveforms.pdf
│
├── report
│   └── Project_Report.pdf
│
└── README.md
```

---

# Verification

The processor was verified using a dedicated Verilog testbench in the ModelSim simulation environment.

Simulation results confirm the correct execution of the implemented instruction set and validate the functionality of the datapath, control unit and memory system.

---

# Simulation Results

> <img width="960" height="511" alt="simulation" src="https://github.com/user-attachments/assets/ba23b42c-0340-4754-b2a7-880acb00ef93" />





```markdown

```
A complete zoomable waveform file is also available in:

```
docs/simulation_waveforms.pdf
```

---

# Development Environment

* Verilog HDL
* ModelSim
* Modular RTL Design

---

# Future Improvements

Possible future extensions of this project include:

* Support for additional MIPS instructions
* Exception and interrupt handling
* Hardware implementation on FPGA
* Multi-Cycle implementation
* Pipeline implementation
* Performance optimization

---

# Reference

David A. Patterson

John L. Hennessy

**Computer Organization and Design: The Hardware/Software Interface**

---

# Author

**Saeed Khabbaz Sirjani**

Embedded Systems Engineer

## Connect with Me

- GitHub: https://github.com/saeed-khabbaz
- LinkedIn: (https://www.linkedin.com/in/saeed-khabbaz-06a9b2417)
- YouTube: (https://youtube.com/ChireDastElectronicAcademy)
