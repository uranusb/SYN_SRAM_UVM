//Sequential WR & RD
class seq_sequence extends uvm_sequence#(sr_sequence_item);
  `uvm_object_utils(seq_sequence)
  
  function new(string name = "seq_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_info(get_type_name(), $sformatf("******** Sequential WR RD ********"), UVM_LOW)
    repeat(16) begin
      req = sr_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {wr_en == 1;});
      finish_item(req);
    end
    repeat(16) begin
      req = sr_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {wr_en == 0;});
      finish_item(req);
    end
  endtask
endclass

//Random WR RD
class rand_sequence extends uvm_sequence#(sr_sequence_item);
  `uvm_object_utils(rand_sequence)
  
  function new(string name = "rand_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_info(get_type_name(), $sformatf("******** Random WR RD ********"), UVM_LOW)
    repeat(64) begin
      req = sr_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
  endtask
endclass
  
  
  
  
