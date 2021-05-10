class sr_monitor extends uvm_monitor;
  virtual sr_interface vif;
  sr_sequence_item item_got;
  uvm_analysis_port#(sr_sequence_item) item_got_port;
  `uvm_component_utils(sr_monitor)
  
  function new(string name = "sr_monitor", uvm_component parent);
    super.new(name, parent);
    item_got_port = new("item_got_port", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_got = sr_sequence_item::type_id::create("item_got");
    if(!uvm_config_db#(virtual sr_interface)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "VIF not found!")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      item_got.wr_en <= vif.wr_en;
      item_got.addr <= vif.addr;
      @(posedge vif.clk);
      if(item_got.wr_en == 1)begin
        item_got.din <= vif.din;
        #1
        item_got_port.write(item_got);
      end
      else begin
        @(posedge vif.clk);
        item_got.dout <= vif.dout;
        #1
        item_got_port.write(item_got);
      end
    end
  endtask
    
endclass
    