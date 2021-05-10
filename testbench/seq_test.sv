`include "sr_base_test.sv"

class seq_test extends sr_base_test;
  seq_sequence seq_seq;
  `uvm_component_utils(seq_test)
  
  function new(string name = "seq_test",uvm_component parent);
    super.new(name,parent);
  endfunction : new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq_seq = seq_sequence::type_id::create("seq_seq");
  endfunction : build_phase
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_seq.start(sr_env.sr_agt.sr_seqr);
    phase.drop_objection(this);
  endtask
  
endclass
  