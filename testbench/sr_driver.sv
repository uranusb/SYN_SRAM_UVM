class sr_driver extends uvm_driver#(sr_sequence_item);
  virtual sr_interface vif;
  `uvm_component_utils(sr_driver)
  
  function new(string name = "sr_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual sr_interface)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "VIF not found!")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      main();
      seq_item_port.item_done;
    end
  endtask
    
  virtual task main();
    vif.wr_en<= req.wr_en;
    vif.addr <= req.addr;
    @(posedge vif.clk);
    if(req.wr_en == 1)begin
      vif.din <= req.din;

    end
    else begin
      @(posedge vif.clk);
      req.dout <= vif.dout;
    end
  endtask
    
endclass
      
    
  