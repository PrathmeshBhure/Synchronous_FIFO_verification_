class wr_rd_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(wr_rd_seq)
  seq_item h_item;
  
  function new(string name = "wr_rd_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
    write();
    read(); 
  endtask
 
    //-------------------- Write seq-------------------//
  virtual task write(); 
    h_item = seq_item:: type_id::create("h_item");
    start_item(h_item);
    assert(h_item.randomize() with {wr == 1;rd == 0;});
    `uvm_info("fifo_seq",$sformatf("Done generation in sequence => %s items",h_item.sprint()),UVM_MEDIUM)
   // $display("My packet %p",h_item);
    finish_item(h_item);

  endtask
  
//  -------------------- Read seq-------------------//
  virtual task read(); 
    h_item = seq_item:: type_id::create("h_item");
    start_item(h_item);
    assert(h_item.randomize() with {wr == 0; rd == 1; data_in==0;});//data_in==0;
    `uvm_info("fifo_seq",$sformatf("Done generation  in sequence => %s items",h_item.sprint()),UVM_MEDIUM)
    // $display("My packet %p",h_item);
    finish_item(h_item);

  endtask

endclass

class alt_wr_rd_seq extends wr_rd_seq;
  `uvm_object_utils(alt_wr_rd_seq)
  seq_item h_item;
  
  function new(string name = "alt_wr_rd_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
    //#10;
    repeat(8) begin
    super.write();
    super.read(); 
     // #2;
    end
  endtask
  
endclass

class mul_wr_seq extends wr_rd_seq;
  `uvm_object_utils(mul_wr_seq)
  seq_item h_item;
  
  function new(string name = "mul_wr_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
   // #10;
    repeat(8) begin
    super.write();
    end
  endtask
  
endclass

class mul_rd_seq extends wr_rd_seq;
  `uvm_object_utils(mul_rd_seq)
  seq_item h_item;
  
  function new(string name = "mul_rd_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
    //#10;
    repeat(8) begin
    super.read();
    end
  endtask
  
endclass

class roll_over_seq extends wr_rd_seq;
  `uvm_object_utils(roll_over_seq)
  seq_item h_item;
  
  function new(string name = "roll_over_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
    //#10;
    repeat(9) begin
    super.write();
    end
    //#2;
    repeat(9) begin
    super.read();
    end
  endtask
  
  
endclass

class random_seq extends wr_rd_seq ;
  `uvm_object_utils(random_seq)
  seq_item h_item;
  
  function new(string name = "random_seq");
    super.new(name);
   // `uvm_info("Sequence","Inside FIFO Sequence New ",UVM_MEDIUM)
   endfunction
  
  virtual task body();
    //#10;
    repeat(10) begin
      full_random();
    end
  endtask
 
    //-------------------- random seq-------------------//
  virtual task full_random(); 
    h_item = seq_item:: type_id::create("h_item");
    start_item(h_item);
    assert(h_item.randomize());
    `uvm_info("fifo_seq",$sformatf("Done generation in sequence => %s items",h_item.sprint()),UVM_MEDIUM)
   // $display("My packet %p",h_item);
    finish_item(h_item);

  endtask
  


endclass

