# DATA ENCRYPTION STANDARD - VHDL
---

FPGA implementation of the Data Encryption Standard algorithm, witten in VHDL.
This module is not fully pipelined and thus targeted at low logic-block occupancy rather than maximal performances.

### Module Architecture
![alt tag](https://raw.githubusercontent.com/audeberc/DES-VHDL/master/architecture.png)
### FSM 
![alt tag](https://raw.githubusercontent.com/audeberc/DES-VHDL/master/FSM.png)
### Key computation
![alt tag](https://raw.githubusercontent.com/audeberc/DES-VHDL/master/Calckey.png)
### Crypto block
![alt tag](https://raw.githubusercontent.com/audeberc/DES-VHDL/master/crypto.png)

#### Area report : 
  978 register blocks, 511 LUT => less than 1% of Cyclone V SoC 5CSEMA5F31
### Performances :
  85 MB/s
  
