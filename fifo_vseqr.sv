class fifo_vseqr extends uvm_sequencer;
  `uvm_component_utils(fifo_vseqr)
  fifo_ip_seqr	h_ip_seqr;   // handle of physical seqr
  
  function new(string name = "fifo_vseqr",uvm_component parent);
    super.new(name, parent);
   // `uvm_info("VSEQr","Inside FIFO VSEQr NEW ",UVM_MEDIUM)
    
  endfunction
  
  virtual task body();
    h_ip_seqr=fifo_ip_seqr::type_id::create("h_ip_seqr",this);
  endtask
  
endclass