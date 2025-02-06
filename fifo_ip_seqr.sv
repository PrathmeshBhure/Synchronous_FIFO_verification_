class fifo_ip_seqr extends uvm_sequencer  #(seq_item);
  `uvm_component_utils(fifo_ip_seqr)
    
  function new(string name = "fifo_ip_seqr",uvm_component parent);
    super.new(name, parent);
   // `uvm_info("IP_SEQR","Inside FIFO IP_SEQR NEW ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   // `uvm_info("IP_SEQR","Inside FIFO IP_SEQR Build Phase ",UVM_MEDIUM)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
   // `uvm_info("IP_SEQR","Inside FIFO IP_SEQR Connect phase ",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // `uvm_info("IP_SEQR","Inside FIFO IP_SEQR Run Phase",UVM_MEDIUM)
  endtask
  
endclass