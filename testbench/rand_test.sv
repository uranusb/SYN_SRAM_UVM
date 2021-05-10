`include "sr_base_test.sv"

class rand_test extends sr_base_test;
  rand_sequence rand_seq;
  `uvm_component_utils(rand_test)
  
  function new(string name = "rand_test",uvm_component parent);
    super.new(name,parent);
  endfunction : new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rand_seq = rand_sequence::type_id::create("rand_seq");
  endfunction : build_phase
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rand_seq.start(sr_env.sr_agt.sr_seqr);
    phase.drop_objection(this);
  endtask
  
endclass