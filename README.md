> 🇬🇷 Ελληνική έκδοση: [README_GR.md](./README_GR.md)

# Computer Architecture Fundamentals – Laboratory
### Course: Computer Architecture Fundamentals
### 2nd Year – 3rd Semester

This repository contains my laboratory work for the course
**Computer Architecture Fundamentals**, focusing on low-level programming
and processor architecture concepts.

The laboratory is based on **ARM assembly programming** and was conducted
using an **AT91SAM9261-based microcontroller (AT91 family)**.  
The exercises explore how software interacts directly with processor
components such as registers, memory, and the stack.

---

## 🧠 Platform & Architecture

- **Processor Architecture:** ARM (32-bit RISC)
- **Core:** ARM926EJ-S
- **Programming Language:** ARM Assembly
- **Focus:** Instruction-level behavior and hardware-oriented programming

---

## 🧪 Laboratory Exercises

### 🔹 Lab 1 – Data Movement & Register Tracing
- Data transfer instructions (MOV/MVN, LDR/STR variants)
- Byte/halfword loads (LDRB/LDRSH) and addressing modes
- Multiple load/store (STM/LDM) and stack-related behavior
- Step-by-step tracing of register values after each instruction

### 🔹 Lab 2 – Summations with Different Data Widths
Sub-exercises:
- Sum of **bytes**
- Sum of **halfwords**
- Sum of **words**
- Sum of **longwords**
Focus: correct memory access, alignment, and accumulation logic in ARM assembly

### 🔹 Lab 3 – Status Register (CPSR), Memory Traversal & Fibonacci
Sub-exercises:
- Study of the **CPSR** (flags and condition behavior)
- Sequential memory access (iterating through consecutive addresses)
- Fibonacci computation in assembly (loops, register usage, result tracking)

### 🔹 Lab 4 – Arithmetic Expressions, Max Search & Polynomial Evaluation
Sub-exercises:
- Computation of a mathematical formula (arithmetic + shifts where applicable)
- Finding the maximum value in a results table (table scan)
- Polynomial evaluation (loop-based computation)

### 🔹 Lab 5 – Sorting (Insertion Sort, In-Place)
Sub-exercises:
- Implement **insertion sort** using an in-place approach
- Execute and verify correctness of the produced sorted output

### 🔹 Lab 6 – LFSR (Linear Feedback Shift Register)
Sub-exercises:
- LFSR implementation in ARM assembly
- Using LFSR to generate pseudo-random numbers
- 4-bit range LFSR variant for pseudo-random number generation


---

## 📁 Repository Structure

```text
computer-architecture-lab/
├── README.md
├── README_GR.md
│
├── exercises/
│   ├── exercise1/
│   │   ├── askisi_1.s
│   │   └── results.xlsx
│   │
│   ├── exercise2/
│   │   ├── askisi2_i.s
│   │   ├── askisi2_ii.s
│   │   ├── askisi2_iii.s
│   │   ├── askisi2_iv.s
│   │   └── results.xlsx
│   │
│   ├── exercise3/
│   │   ├── askisi3_i.s
│   │   ├── askisi3_ii.s
│   │   ├── askisi3_iii.s
│   │   └── results.xlsx
│   │
│   ├── exercise4/
│   │   ├── askisi4_i_ii.s
│   │   ├── askisi4_iii.s
│   │   └── results.xlsx
│   │
│   ├── exercise5/
│   │   └── askisi5_i_ii.s
│   │
│   └── exercise6/
│       ├── askisi6_i_ii.s
│       ├── askisi6_iii.s
│       └── results.xlsx

```
---

## 🔐 **License**
These solutions represent my personal work for academic laboratory exercises.  
They are provided for **learning and reference only**.  
**Please do not submit them as your own coursework**.

**All Rights Reserved.**
