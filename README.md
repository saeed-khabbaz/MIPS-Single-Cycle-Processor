# MIPS Single-Cycle Processor

A Verilog HDL implementation of a Single-Cycle MIPS Processor based on the architecture presented in *Computer Organization and Design* by Patterson and Hennessy.

## Overview

This project presents a Verilog HDL implementation of a Single-Cycle MIPS Processor developed from the architecture described in Patterson & Hennessy's *Computer Organization and Design*.

All modules were individually designed and implemented from scratch, including the datapath components, control unit, and verification environment.

The processor supports a subset of R-Type, I-Type and J-Type instructions and follows the classical MIPS datapath architecture.

The design was developed and verified using the ModelSim simulation environment.

---

## Features

- Single-Cycle Processor Architecture
- Modular Verilog Design
- Separate Control Unit
- Separate ALU Control Unit
- Register File Implementation
- Instruction Memory
- Data Memory
- Sign Extension Unit
- ModelSim Verification

---

## Supported Instructions

### R-Type Instructions

- add
- sub
- and
- or
- xor

### I-Type Instructions

- addi
- andi
- ori
- lw
- sw
- beq
- bne

### J-Type Instructions

- j

---

## Project Structure

src/
├── ALU.v

├── ALU_control_unit.v
├── control_unit.v
├── data_memory.v
├── extension.v
├── inst_memory.v
├── InstructionParser.v
├── PC.v
├── reg_file.v
└── core.v

testbench/
└── testbench.v

docs/
├── datapath.png
└── simulation_waveforms.pdf

report/
└── project_report.pdf
---

## Verification

The processor was verified through dedicated testbench simulations in ModelSim.

Simulation waveforms were analyzed to validate the correct execution of supported instructions.

---

## Architecture

The processor datapath follows the standard Single-Cycle MIPS architecture presented in Patterson & Hennessy's textbook.

Architecture diagrams and simulation results are available in the docs directory.

---

## Author

Saeed Khabbaz Sirjani

Embedded Systems Engineer | Verilog HDL | Digital design | Computer Archtecture
