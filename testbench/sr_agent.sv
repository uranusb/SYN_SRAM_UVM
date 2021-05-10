`include "sr_sequence_item.sv"
`include "sr_sequence.sv"
`include "sr_sequencer.sv"
`include "sr_driver.sv"
`include "sr_monitor.sv"


class sr_agent extends uvm_agent;
  sr_sequencer sr_seqr;
  sr_driver sr_dri;
  sr_monitor sr_mon;
  `uvm_component_utils(sr_agent)
  
  function new(string name = "sr_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active() == UVM_ACTIVE)begin
      sr_seqr = sr_sequencer::type_id::create("sr_seqr", this);
      sr_dri = sr_driver::type_id::create("sr_dri", this);
    end
    sr_mon = sr_monitor::type_id::create("sr_mon", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE)begin
      sr_dri.seq_item_port.connect(sr_seqr.seq_item_export);
    end
  endfunction
  
endclass