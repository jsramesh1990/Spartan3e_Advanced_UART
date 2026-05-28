# UART (Universal Asynchronous Receiver Transmitter) in Embedded Linux 

## Overview

UART (Universal Asynchronous Receiver Transmitter) is one of the most widely used serial communication protocols in:
- embedded systems
- Linux devices
- microcontrollers
- SoCs
- debugging interfaces

UART enables:
- asynchronous serial communication
- device-to-device communication
- console access
- debugging

UART is extremely important in:
- bootloaders
- Linux kernel debugging
- embedded board bring-up

---

# 1. What is UART?

UART is:

```text
A hardware serial communication peripheral
```

Used for:
```text
asynchronous data transfer
```

between devices.

---

# 2. Why UART is Important

UART is commonly used for:
- Linux serial console
- bootloader logs
- GPS modules
- Bluetooth modules
- modem communication
- MCU communication

---

# 3. UART Communication Characteristics

| Feature | Description |
|---------|-------------|
| Asynchronous | No clock line |
| Full duplex | Simultaneous TX/RX |
| Serial communication | One bit at a time |
| Point-to-point | Device-to-device |

---

# 4. UART High-Level Architecture

```text
+-------------------+
| CPU / Linux       |
+-------------------+
        ↓
+-------------------+
| UART Controller   |
+-------------------+
   ↓           ↓
 TX Line     RX Line
``` id="arch1"

---

# 5. UART Full Duplex Communication

```text
Device A TX ─────────► Device B RX

Device A RX ◄───────── Device B TX
``` id="duplex1"

---

# 6. UART Signal Lines

| Signal | Purpose |
|--------|---------|
| TX | Transmit |
| RX | Receive |
| GND | Ground |

Optional:
- RTS
- CTS

for flow control.

---

# 7. UART Basic Communication Flow

```text
Application Writes Data
          ↓
Linux UART Driver
          ↓
UART Hardware TX Register
          ↓
Serial Transmission
          ↓
Receiver UART
          ↓
Linux Driver
          ↓
Application Reads Data
``` id="flow1"

---

# 8. UART Data Transmission

UART sends:
```text
one bit at a time
```

in serial format.

---

# 9. UART Frame Structure

Typical UART frame:

```text
Start Bit
Data Bits
Optional Parity Bit
Stop Bit(s)
``` id="frame1"

---

# 10. UART Frame Example

```text
| Start | 8 Data Bits | Stop |
``` id="frame2"

---

# 11. Start Bit

Indicates:
```text
beginning of transmission
```

Usually:
```text
LOW signal
```

---

# 12. Stop Bit

Indicates:
```text
end of transmission
```

Usually:
```text
HIGH signal
```

---

# 13. Data Bits

Common configurations:
- 5 bits
- 6 bits
- 7 bits
- 8 bits

Most common:
```text
8-bit UART
```

---

# 14. Parity Bit

Used for:
```text
basic error detection
```

Types:
- even parity
- odd parity
- none

---

# 15. Baud Rate

Baud rate =
```text
bits transmitted per second
```

Common baud rates:

| Baud Rate |
|-----------|
| 9600 |
| 115200 |
| 921600 |

---

# 16. UART Configuration Example

```text
115200 8N1
```

Meaning:

| Parameter | Value |
|----------|------|
| Baud Rate | 115200 |
| Data Bits | 8 |
| Parity | None |
| Stop Bits | 1 |

---

# 17. UART Timing

Both devices must use:
```text
same baud rate
```

Otherwise:
```text
data corruption occurs
```

---

# 18. UART Hardware Components

UART peripheral includes:
- TX register
- RX register
- FIFO
- baud generator
- interrupt controller

---

# 19. UART FIFO

FIFO =
```text
First-In-First-Out buffer
```

Used to:
- reduce interrupt frequency
- improve throughput

---

# 20. UART Transmission Flow

```text
CPU Writes Byte
      ↓
TX FIFO
      ↓
UART Shift Register
      ↓
TX Pin
``` id="tx1"

---

# 21. UART Reception Flow

```text
RX Pin
   ↓
UART Shift Register
   ↓
RX FIFO
   ↓
Interrupt Generated
   ↓
CPU Reads Data
``` id="rx1"

---

# 22. UART Interrupts

UART commonly generates interrupts for:
- RX data available
- TX empty
- errors

---

# 23. UART Interrupt Flow

```text
Byte Received
      ↓
UART RX Interrupt
      ↓
ISR Executes
      ↓
Driver Reads Data
``` id="irq1"

---

# 24. UART in Embedded Linux

Linux uses:
```text
TTY subsystem
```

for UART communication.

---

# 25. Linux UART Stack

```text
Application
     ↓
TTY Layer
     ↓
UART Driver
     ↓
UART Hardware
``` id="stack1"

---

# 26. UART Device Files

Linux UART devices:

```text
/dev/ttyS0
/dev/ttyAMA0
/dev/ttyUSB0
```

---

# 27. Common UART Device Names

| Device | Meaning |
|--------|---------|
| ttyS0 | Standard serial port |
| ttyAMA0 | ARM PL011 UART |
| ttyUSB0 | USB-UART adapter |

---

# 28. UART Driver Responsibilities

Driver handles:
- baud configuration
- interrupts
- FIFO management
- TX/RX handling

---

# 29. UART Driver Flow

```text
User Write()
     ↓
TTY Layer
     ↓
UART Driver
     ↓
TX FIFO
     ↓
Serial Output
``` id="drv1"

---

# 30. UART Initialization

Typical configuration:
- baud rate
- parity
- stop bits
- interrupts enabled

---

# 31. UART Register Example

Typical registers:
- TX register
- RX register
- status register
- control register

---

# 32. UART Polling Mode

CPU continuously checks:
```text
UART status register
```

Less efficient.

---

# 33. Interrupt Mode

Preferred mode.

UART notifies CPU only when:
```text
data available
```

---

# 34. DMA-based UART

High-speed UART may use:
```text
DMA
```

to reduce CPU load.

---

# 35. DMA UART Flow

```text
UART RX
   ↓
DMA Controller
   ↓
RAM Buffer
``` id="dma1"

---

# 36. UART Flow Control

Used to prevent:
```text
buffer overflow
```

---

# 37. Hardware Flow Control

Signals:
- RTS
- CTS

---

# 38. RTS/CTS Flow

```text
Sender RTS
      ↓
Receiver CTS
      ↓
Transmission Allowed
``` id="flow2"

---

# 39. Software Flow Control

Uses:
```text
XON/XOFF
```

characters.

---

# 40. UART Error Types

| Error | Meaning |
|------|---------|
| Framing Error | Wrong stop bit |
| Parity Error | Incorrect parity |
| Overrun Error | FIFO overflow |

---

# 41. UART Bootloader Usage

Bootloaders use UART for:
- console output
- firmware download
- debugging

---

# 42. Linux Serial Console

Kernel boot logs often printed via:
```text
UART console
```

---

# 43. Boot Console Example

```bash
console=ttyS0,115200
``` id="boot1"

---

# 44. U-Boot UART Example

```text
U-Boot 2024.01
```

printed through UART.

---

# 45. UART Device Tree Example

```dts
uart0: serial@101f1000 {
    compatible = "arm,pl011";
    reg = <0x101f1000 0x1000>;
    interrupts = <5>;
};
``` id="dt1"

---

# 46. UART Driver Registration

Linux UART drivers register with:
```text
serial core subsystem
```

---

# 47. User-Space UART Access

Applications use:
```c
open()
read()
write()
```

on UART device files.

---

# 48. UART User-Space Example

```c
fd = open("/dev/ttyS0", O_RDWR);
``` id="usr1"

---

# 49. Configure UART in Linux

Using:
```bash
stty
```

Example:

```bash
stty -F /dev/ttyS0 115200
``` id="stty1"

---

# 50. Reading UART Data

```bash
cat /dev/ttyS0
``` id="cat1"

---

# 51. Sending UART Data

```bash
echo "hello" > /dev/ttyS0
``` id="echo1"

---

# 52. UART Debugging Tools

| Tool | Purpose |
|------|---------|
| minicom | Serial terminal |
| screen | UART terminal |
| picocom | Lightweight serial tool |

---

# 53. minicom Example

```bash
minicom -D /dev/ttyUSB0
``` id="mini1"

---

# 54. USB-to-UART Adapters

Common chips:
- FTDI
- CP2102
- CH340

---

# 55. UART in Embedded Linux Boot Flow

```text
Power ON
    ↓
ROM Code UART Logs
    ↓
SPL UART Logs
    ↓
U-Boot UART Console
    ↓
Kernel Boot Messages
``` id="boot2"

---

# 56. UART Advantages

- simple
- low cost
- easy debugging
- widely supported

---

# 57. UART Disadvantages

- lower speed
- point-to-point only
- no clock synchronization
- limited distance

---

# 58. UART vs SPI vs I2C

| Feature | UART | SPI | I2C |
|---------|------|-----|-----|
| Clock Line | No | Yes | Yes |
| Full Duplex | Yes | Yes | Half |
| Complexity | Simple | Medium | Medium |
| Multi-device | No | Limited | Yes |

---

# 59. Complete UART Communication Workflow

```text
Application Sends Data
         ↓
TTY Layer
         ↓
UART Driver
         ↓
UART TX FIFO
         ↓
Serial Transmission
         ↓
Receiver UART RX FIFO
         ↓
Receiver Driver
         ↓
Receiver Application
``` id="final1"

---

# 60. Summary

- UART is asynchronous serial communication
- Uses TX/RX lines
- Widely used in embedded Linux systems
- Essential for debugging and console access
- Linux uses TTY subsystem for UART handling
- UART supports interrupts, DMA, and flow control

---

````
