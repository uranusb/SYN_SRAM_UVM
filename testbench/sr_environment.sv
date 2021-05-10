`include "sr_agent.sv"
`include "sr_scoreboard.sv"

class sr_environment extends uvm_env;
  sr_agent sr_agt;
  sr_scoreboard sr_scb;
  `uvm_component_utils(sr_environment)
  
  function new(string name = "sr_environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sr_agt = sr_agent::type_id::create("sr_agt", this);
    sr_scb = sr_scoreboard::type_id::create("sr_scb", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    sr_agt.sr_mon.item_got_port.connect(sr_scb.item_got_export);
  endfunction
  
endclass