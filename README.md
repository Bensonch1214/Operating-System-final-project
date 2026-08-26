# 8051 Operating System Final Project

This repository contains the final project for the Operating Systems course. The project focuses on building a simple, custom operating system for the 8051 microcontroller, implemented and simulated using **EdSim51**. The development progresses through five project checkpoints (PPC1 to PPC5), gradually introducing multithreading, preemptive scheduling, synchronization, and finally, a playable mini-game.

## Tools & Environment

*   **Target Architecture:** 8051 Microcontroller
*   **Simulator:** EdSim51 (Version 2.1.39)
*   **Compiler:** SDCC (Small Device C Compiler)
*   **Build System:** Make

## Project Progression

### PPC1: Cooperative Multithreading
*   **Objective:** Implement basic thread creation and cooperative context switching.
*   **Key Features:**
    *   Implemented `ThreadCreate()` to allocate stacks and initialize contexts for new threads.
    *   Developed a cooperative Producer-Consumer model where threads explicitly yield control using `ThreadYield()`.
    *   The Producer generates characters ('A', 'B', 'C', 'D'), and the Consumer transmits them via the UART serial port.
    *   Reference:`OS_ppc1.pdf`

### PPC2: Preemptive Multithreading
*   **Objective:** Introduce preemptive scheduling using timer interrupts.
*   **Key Features:**
    *   Configured Timer 0 in mode 0 (13-bit timer) to generate periodic preemption interrupts.
    *   Implemented an Interrupt Service Routine (ISR) `timer0_ISR` and `myTimer0Handler` to perform context switching automatically via Round-Robin scheduling.
    *   The Producer and Consumer now run concurrently without explicit yields, verifying the correctness of the preemptive scheduler.

### PPC3: Synchronization with Semaphores
*   **Objective:** Solve the Producer-Consumer problem using semaphores.
*   **Key Features:**
    *   Implemented `SemaphoreWait()` (busy-wait via inline assembly) and `SemaphoreSignal()` (using the atomic `INC` instruction).
    *   Utilized semaphores (`mutex`, `empty`, `full`) to protect a shared 3-slot circular buffer.
    *   The Producer generates characters ('A' to 'Z') and writes to the buffer.
    *   The Consumer reads from the buffer and transmits via UART.
    *   Confirmed correct synchronization by observing the continuous and sequential UART output (e.g., `ABCDEFGHIJKLMNOPQRSTUVWXYZ`).

### PPC4: Multi-Producer Synchronization & Scheduling Fairness
*   **Objective:** Handle multiple producers and address starvation issues in scheduling.
*   **Key Features:**
    *   Added a second producer (`Producer2`) that generates digits ('0' to '9').
    *   Identified a starvation issue under pure Round-Robin scheduling, where one producer could monopolize the buffer.
    *   Resolved the unfairness by implementing a **ping-pong scheduling policy** (Thread 0 -> Thread 1 -> Thread 2 -> Thread 1 -> Thread 0...), ensuring the Consumer is always scheduled between the two producers.
    *   Verified the fix by observing alternating letters and digits in the UART output (e.g., `ABC012DEF345`).

### PPC5: Dinosaur Game (Final Application)
*   **Objective:** Build a real-time mini-game utilizing the preemptive OS and EdSim51 peripherals.
*   **Key Features:**
    *   **I/O Integration:** Integrated Button Bank (Producer 1) and Matrix Keypad (Producer 2) for input, and the LCD (Consumer) for output.
    *   **Thread Design:**
        *   `main` (Thread 0): Handles game initialization, resets, difficulty selection (via keypad), and the game-over screen.
        *   `render_task` (Thread 1): Updates the LCD every frame, shifts the cactus obstacles (stored efficiently as a 16-bit bitmap per row), checks for collisions, and updates the score.
        *   `keypad_ctrl` (Thread 2): Reads keypad inputs ('2' for up, '8' for down) to move the dinosaur, using `__critical` blocks to prevent race conditions during LCD updates.
    *   **Difficulty Scaling:** Configured Timer 0 overflow rate based on the selected difficulty, directly controlling the game's scrolling speed.
    *   Reference: `OS_ppc5.pdf`

## How to Compile and Run

1.  Navigate to the specific checkpoint directory (e.g., `cd ppc5/ppc5_2`).
2.  Run `make clean` to remove any old build files.
3.  Run `make` to compile the C and Assembly files using SDCC. This will generate a `.hex` file (e.g., `testcoop.hex` or `dino.hex`).
4.  Open **EdSim51**.
5.  Click **Load** and select the generated `.hex` file.
6.  Ensure the **Update Freq.** is set appropriately (e.g., 1000 or 10000 for faster simulation).
7.  Click **Run** to start the OS simulation.

---
*Developed for NTHU Operating Systems Course.*
