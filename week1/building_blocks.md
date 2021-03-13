# About the building blocks of IC's and Transistors

> Some diods and you have a transistor. Some transitors, capacitors and resistrors and you have an IC

To undestand this understand Ohm's Law
- V = I * R
- and the Current is I = V/R || I = P/R if P is known

The Diode:
===
- Barebone building blocks of (IC's)
- Conduct electrical signal in one direction (forward direction) through the conductor
- Conducts using (https://en.wikipedia.org/wiki/P%E2%80%93n_junction)[pn-junction]

Forward Voltage (FV):
- voltage where the diod starts to fully conduct within it's rating

Types:
- Signal Diods (medium Current and forward volta)
- Power Diods (Higher Current, Larger FV)
- Light Emitting Diods (LED)
- & more variants like Schottky diods...

Common Materials(Conductors):
- Silicon (Si) (most commonly used)
- Germanium (Ge) (Seldomly used; Takes lower input voltage and sometimes also has advantages over Si)

The Transistor:
===
- Amplifying or **switching** electrical signals (current power in an EC)
- I want my input current to go up
- I want to control my input current to flow in a certain way
- If you have a few they can at least switch or amplify the current wich is still amazing
- If you have thousands or billions they can to magic (Memory, CPU's)
- 3 Terminal/Pin Devices
- have 2 diods
- Rely on semiconductors

Marterials (Semiconductors):
- We need some doping element to create the following special semiconductor materials:
  - (https://circuitglobe.com/p-type-semiconductor.html)[p-type] (a lot of holes, less amount of electrons, lower conductivity, nh >> ne)
  - (https://circuitglobe.com/n-type-semiconductor.html)[n-type] (lesser holes, a lot of electrons, higher conductivity ne >> nh)
  - The (https://circuitglobe.com/difference-between-p-type-and-n-type-semiconductor.html)[Difference] is in the amount if holes vs electrons

Ways of operation:
- Saturation -- Free flow from C->E like a [https://en.wikipedia.org/wiki/Short_circuit](Short Circuit)
- Cut-off -- Turn of flow like an [https://en.wikipedia.org/wiki/Open-circuit_voltage](Open Circuit)
- Active -- Proportional Current form C-E like flow into B (Usually what you want)
- Reverse-Active Proportional from Base flow from E-C (Not really nice)

Bipolar junction transistor (BJT):

Terminals:
- Emitter(E) (n-type, diode)
- Collector(C) (n-type, diode)
- Base (B) (p-type)

Emitter:
- Suply majority of charge
- Forward Bias Connection (to be able to emit)

Collector:
- Collect majority of charge
- Reverse Bias Connection (to be able to collect)

Base:
- input circuit to E as forward bias
- output circuit to C as reverse bias

Flow of BJT(NPN,PNP) Transistors:
```
NPN Transistor:
         E   C
 Flow to E \ /
            |
           Base(B)

------------------------------
PNP Transistor:
         E   C
 Flow to B \ /
            |
           Base(B)
```

Metal-Oxide Field-effect transistor (MOSFET)
  - ??

<!-- TODO: know more about IC's -->
IC (Integrated Circuit):
===
- bunch of interconnected transistors, resistors or capacitors put together into one chip
- ??

Some Research Links:
===
- [https://electronics.stackexchange.com/questions/78366/why-cant-two-series-connected-diodes-act-as-a-bjt#:~:text=A%20PNP%20BJT%20will%20function,the%20other%20through%20the%20wire.](Why can't two series-connected diodes act as a BJT?)
- [https://socratic.org/chemistry/the-electron-configuration-of-atoms/arrangement-of-electrons-in-orbitals-spd-and-f](s,p,d,f Orbitals)
- [https://www.differencebetween.com/difference-between-silicon-and-vs-germanium/](Ge vs. Si)
