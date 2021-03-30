About those Field Programmable Gate Arrays (FPGA's)

Boolean alrebra (Basic Gates)
---

Most definite basic internal components:
- LUT's,
- Flip-Flops
- some form of oscillator to produce a stable central clock
- BRAM
- etc

Logic types in an fpga or any **oscilliated** circuit
- Combinatorial (single State logic, takes present state into account eg. 3-input LUT(8LA))
- Sequential Logic (Two State logic takes past and present states into account eg. d-ff)

Metastability:
- "metastable" unknown/non-deterministic output from flip flop  (so no clue if 1 or 0 mmh shit... but why)
- ahh setup/hold time violations.. what??

Setup/ Hold Time:
- the time before a clock edge for an inout to be stable again
- the time after the clock edge for an input to be stable again

The concept Clock in a synchronous  (Ckl)
- we use an oscilliator which is device that creates swings
 - this mainly using quartz and so on to create swings
- steady stream of low to high to low voltage is made available from this quartz crystal
- the faster the clock the faster the design will run

Clock Domain(CD)
- each clock forms a clock domain (CD)
- thats's easy but we are talking about how to get from one clock to another (Crossing CD's)
  and not suffer to much from metastibility?

Ways to "Crossing Clock Domains":
- slow to fast -> faster clock with douoble-flopping the data
- fast to slow -> stretch clock pulses
- best way -> use fifo with dual clock support, and flags for almost full/emty

Look Up Tables (LUTS)
- Basically just provide the boolean algebra computation

```
->  Q = (A or B) not A

2 inputs -> 4 outputs goes with 2^n

 A B Q
 -----
 0 0 1
 0 1 1
 1 0 0
 1 1 1
-------

- think about it:
- a 3 input LUT can make 2^3=8 logical equations
- a 4 input LUT can make 2^4=16 logical equations
- a 5 input LUT can make 2^5=32 logical equations

so when we chain one 3 input lut with 3 more we gain 24 more possible equations
and we compute more stuff

```
- Modern LUT's have 3 to 5 inputs
- to compute more complex equations we combine LUT's
- an fpga will probably use tousands of LUT's to do boolean algebra

- think about it:
- a 3 input LUT can make 2^3=8 logical equations
- a 5 input LUT can make 2^5=32 logical equations

Flip Flop(Register):

2 state devices that control sequential logic

Types:
- D (most common)
- JK (not very common)
- T (not very common)

```
D-Flip-Flop:

-----|------
|    S     |
|D      Q -|
|>      Q'-|
|    R     |

D: Data input
Q: Data output
>: Clock input 0/1

S: Set Pin
R: Reset Pin
```

How the Flip Flop works:
- input comes in with rising clock cycling
- output recognizes this and copyes the value to the output
- when done it 'registeres' it

Synthesizable(A) vs. Non-Synthesizable Code(B):
- A can be directly synthesized to run on an fpga device
- B cannot be directly synthesized to run on an fpga device (e. g. delays in test benches)

Shift Registers:
- multiple flilflops connected together to store multiple bits of data

- Types (really self explanatory)
- serial in serial out (SISO)
- serial in parallel out (SIPO)
- parallel in serial out (PISO)
- parallel in parallel out (PIPO)

Shift Register Counters
- Ring Counter (connected outputs until last connected to first like a ring)
- Johnson Counter/ Twisted Ring (outputs are connected and the last is inverted to the front)

Latches:
 - unclocked flipflop (dont use them)

RAM Types Commonly used
- BRAM (block ram)
- SRAM (static RAM, ddr3 etc)

BRAM(Block Ram):
- its inside the fpga
- at read at clk posedge from Addr while Wr_End is not active
- can only read one value per clock cycle

```
Sigle Port BRAM
Port A    Port B (Not Wired)
Clock ->
Wr En ->
Addr ->
Wr Data ->
Rd Data <-

Dual Port(DPRAM)
TLDR.. same logic BRAM but with dual ports

Port A    Port B (Wired like Port A)
  Clock ->  <- Clock
  Wr En ->  <- Wr En
   Addr ->  <- Addr
Wr Data ->  <- Wr Data
Rd Data <-  -> Rd Data

```

Where to use them?
- 8B/10B encoding for HDMI etc
- FIFOS which you want to use when you deliver buffered data from Point A to B

FIFOS:
- act in First in First out principle (very similar to queues in c  and so on)

```
Write        Read
  Wr En ->  <- rd end
Wr Data ->  -> rd Data
fifo full <-  -> fifo_emty

Fifo underflow
 - never read from emty fifo

Fifo overflow
- never write to full fifo
```
When to use them?
- buffer data to one place from another
- hdmi stuff
- in combinatination with BRAM's to encode/decode
- controllers to send data
- JTAG etc
- crossing  clock domains
- DRAM/SRAM/Flash

<!-- TODO:
  - all that https://www.nandland.com/articles/fpga-101-fpgas-for-beginners.html
  - MMIO (ALSO UPDATE WIKI ARTICLE FOR THIS IN GERMAN)
  - De Morgans Law
  - Karnaugh Maps
  - The Quine-McCluskey method
-->

Links:
- [Flip- Flop](http://hyperphysics.phy-astr.gsu.edu/hbase/Electronic//flipflop.html)
- De Morgan's Law
- Karnaugh Maps
- The Quine-McCluskey method
- [Combinational logic](https://en.wikipedia.org/wiki/Combinational_logic)
- [Sequential logic](https://en.wikipedia.org/wiki/Sequential_logic)
- [NandGame](https://www.nandgame.com/#)
