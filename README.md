# SYN_SRAM_UVM
DUT:

A basic Static RAM (SRAM) with synchronous reset.
Size: Width 16 * Depth 32
wr_en = 1: write data
wr_en = 0: read data

<br />
<br />

Testbench:

Tested on Synopsys VCS.

2 scenarios: 
1) Write 16 packets to the SRAM with random address and data, then randomly read data from 16 random addresses.
2) Do write and read randomly and continuously for 64 times.
