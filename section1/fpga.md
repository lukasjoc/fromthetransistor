About those Field Programmable Gate Arrays (FPGA's)


Boolean alrebra (Basic Terms)
- ??

Components:
- Gates
- LUT's
- Flip-Flops
- etc

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
```
- Modern LUT's have 3 to 5 inputs
- to compute more complex equations we combine LUT's
- an fpga will probably use tousands of LUT's to do boolean algebra

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
-----|------

D: Data input
Q: Data output
>: Clock input

S: Set Pin
R: Reset Pin

```

How the Flip Flop works:
- input comes in with rising clock cycling
- output recognizes this and copyes the value to the output
- when done it 'registeres' it

<!-- Understrand:
  - FIFOS
  - Synthesizable vs. Non-Synthesizable Code
  - BRAM
  - Shift Registers
  - all that https://www.nandland.com/articles/fpga-101-fpgas-for-beginners.html
  - UART's
-->


<!-- TODO: LOOK AT THIS UNDERSTAND AND ADD LINKS-->
Notes:
- [Flip Flop](http://hyperphysics.phy-astr.gsu.edu/hbase/Electronic//flipflop.html)
- De Morgan's Law
- Karnaugh Maps
- The Quine-McCluskey method
