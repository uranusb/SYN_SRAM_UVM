class sr_sequence_item extends uvm_sequence_item;
  rand bit [5:0] addr;
  rand bit [15:0] din;
  rand bit wr_en;
  bit [15:0] dout;
  
  `uvm_object_utils_begin(sr_sequence_item)
  `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(din, UVM_ALL_ON)
  `uvm_field_int(wr_en, UVM_ALL_ON)
  `uvm_field_int(dout, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "sr_sequence_item");
    super.new(name);
  endfunction
  
endclass