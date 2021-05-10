class sr_scoreboard extends uvm_scoreboard;
  uvm_analysis_imp#(sr_sequence_item, sr_scoreboard) item_got_export;
  `uvm_component_utils(sr_scoreboard)
  
  function new(string name = "sr_scoreboard", uvm_component parent);
    super.new(name, parent);
    item_got_export = new("item_got_export", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  bit [15:0] queue[32:0];

  virtual function void write(sr_sequence_item item_got);
    bit [15:0] examdata;
    if(item_got.wr_en == 1)begin
      queue[item_got.addr] = item_got.din;
      `uvm_info(get_type_name(), $sformatf("Write data %4h to address %2h", item_got.din, item_got.addr), UVM_LOW)
    end
    else begin
      examdata = queue[item_got.addr];
      `uvm_info(get_type_name(), $sformatf("Read data %4h from address %2h", item_got.dout, item_got.addr), UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("Ref data %4h", examdata), UVM_LOW)
      if (examdata == item_got.dout)begin
        `uvm_info(get_type_name(), "------------		Pass!		------------", UVM_LOW)
      end
      else begin
        `uvm_warning(get_type_name(), "------------		Fail!		------------")
      end
    end
  endfunction

endclass
  
