import uvm_pkg::*;
`include "uvm_macros.svh"
`include "sr_interface.sv"
//`include "seq_test.sv"
`include "rand_test.sv"

module tb;
  bit clk;
  bit rst;
  
  always #5 clk = ~clk;
  
  initial begin
    rst = 1;
    @(posedge clk);
    @(posedge clk);
    rst = 0;
  end
  
  sr_interface tif(clk, rst);
  
  SRAM DUT(
    .clk(tif.clk),
    .rst(tif.rst),
    .addr(tif.addr),
    .wr_en(tif.wr_en),
    .din(tif.din),
    .dout(tif.dout));
  
  initial begin
    uvm_config_db#(virtual sr_interface)::set(null, "", "vif", tif);
    run_test("rand_test");
  end
    
  initial begin
    $dumpfile("SRAM_TEST.vcd");
    $dumpvars(0, DUT);
  end
endmodule