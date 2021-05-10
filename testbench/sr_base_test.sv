`include "sr_environment.sv"

class sr_base_test extends uvm_test;
  sr_environment sr_env;
  `uvm_component_utils(sr_base_test)
  
  function new(string name = "sr_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sr_env = sr_environment::type_id::create("sr_env", this);
  endfunction
  
endclass
    
    
  
  