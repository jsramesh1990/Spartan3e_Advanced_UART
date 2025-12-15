#  Spartan-3E Advanced UART FPGA Project

![FPGA](https://img.shields.io/badge/FPGA-Spartan--3E-blue)
![HDL](https://img.shields.io/badge/HDL-Verilog-orange)
![OS](https://img.shields.io/badge/OS-Ubuntu%2024.04%20LTS-green)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20ISE%2014.7-red)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

##  Project Overview

This project implements an **advanced UART (Universal Asynchronous Receiver Transmitter) protocol logic** on a **Xilinx Spartan-3E FPGA** using **Verilog HDL**. The design follows **industry-style RTL practices** and integrates advanced features such as FSM-based control, FIFO buffering, configurable baud rate generation, and Linux-based build flow.

The project is fully compatible with **Ubuntu 24.04 LTS** and uses **Xilinx ISE 14.7**, making it ideal for **embedded systems learners, FPGA developers, academic projects, and resume portfolios**.

---

##  Key Features

* Modular and parameterized UART core
* FSM-based Transmitter (TX) and Receiver (RX)
* Baud rate generator (configurable)
* TX and RX FIFO buffers for reliable data transfer
* Register-based control logic
* Loopback-capable top module
* Self-test simulation testbench
* Linux-friendly project structure
* Spartan-3E hardware compatible

---

##  Working Flow

### 1️ Initialization

* System clock and reset are applied
* Baud rate generator starts producing baud ticks

### 2️ Transmit Operation (TX)

* Data is loaded into the TX path
* TX FSM sends:

  * Start bit
  * Data bits (LSB first)
  * Stop bit
* TX FIFO prevents data loss during burst transfers

### 3️ Receive Operation (RX)

* RX FSM detects the start bit
* Samples incoming data at baud tick
* Stores received data into RX FIFO
* RX ready flag is asserted

### 4️ Control & Status

* Registers manage enable, configuration, and status
* Status flags indicate TX busy, RX ready, and FIFO state

### 5️ Verification

* Functional simulation using testbench
* Hardware validation using USB-to-UART and Linux terminal

---

##  Architecture Overview

```
+------------------------+
|   Control Registers    |
+-----------+------------+
            |
+-----------v------------+
|   TX FIFO       RX FIFO|
+-----+-------------+----+
      |             |
+-----v-----+   +---v-----+
|  TX FSM   |   |  RX FSM |
+-----+-----+   +---+-----+
      |             |
      +------v------+ 
          Baud Rate Generator
```

---

##  Project Structure

```
spartan3e-advanced-uart/
├── rtl/                # Verilog RTL source files
├── tb/                 # Testbench
├── constraints/        # UCF pin constraints
├── scripts/            # Build helper scripts
├── docs/               # Architecture & FSM docs
├── README.md
└── LICENSE
```

---

##  Requirements

### Hardware

* Xilinx Spartan-3E FPGA board
* USB-to-UART converter (FTDI)

### Software (Ubuntu 24.04 LTS)

```bash
sudo apt update
sudo apt install -y build-essential git libncurses5 libstdc++6
```

* **Xilinx ISE 14.7** (mandatory for Spartan-3E)
* Terminal tool: `minicom` or `screen`

---

##  Build & Run Procedure (Linux)

### 1️ Clone the Repository

```bash
git clone https://github.com/<your-username>/spartan3e-advanced-uart.git
cd spartan3e-advanced-uart
```

### 2️ Setup Xilinx ISE Environment

```bash
source /opt/Xilinx/14.7/ISE_DS/settings64.sh
```

### 3️ Open ISE

```bash
ise &
```

### 4️ Build Steps in ISE

* Create new project (Spartan-3E device)
* Add all `rtl/*.v` files
* Add `constraints/spartan3e_uart.ucf`
* Synthesize → Implement → Generate Bitstream

---

##  Hardware Testing

```bash
sudo apt install minicom
minicom -b 115200 -D /dev/ttyUSB0
```

* Send characters from PC terminal
* Observe UART TX/RX behavior on FPGA

---

##  Simulation & Verification

* Tool: ISim / ModelSim
* Tested scenarios:

  * TX/RX data flow
  * Reset behavior
  * Baud rate operation

---

##  Learning Outcomes

* UART protocol internals
* FSM-based RTL design
* FPGA constraints & timing
* Linux-based FPGA workflow
* Professional GitHub project structuring

---

##  License

This project is licensed under the **MIT License**.

---

## Ready Description

> Designed and implemented an advanced UART IP core on Spartan-3E FPGA using Verilog HDL, featuring FSM-based TX/RX logic, FIFO buffering, and Linux-based build flow using Xilinx ISE.

---

⭐ If you find this project useful, consider giving it a **star** on GitHub!
