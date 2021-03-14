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
- Modern LUT's have 4 to 5 inputs
- to cobine a more complex Equation we combine LUT's
- an fpga will probably use tousands of LUT's to do boolean algreba

Flip Flop(FF):

Types:
- D
- JK
- T

D-FF
-

Notes:
- De Morgan's Law
- Karnaugh Maps
- The Quine-McCluskey method
