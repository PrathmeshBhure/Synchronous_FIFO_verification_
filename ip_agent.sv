class ip_agent extends uvm_agent;
  `uvm_component_utils(ip_agent)
  fifo_ip_seqr h_ip_seqr;
  fifo_driver	h_ip_dri;
  ip_monitor	h_ip_mon;
  function new(string name = "ip_agent",uvm_component parent);
     super.new(name, parent);
    //`uvm_info("Ip_agent ","Inside FIFO Ip_agent New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    h_ip_seqr = fifo_ip_seqr::type_id::create("h_ip_seqr",this);
    h_ip_dri =fifo_driver::type_id::create("h_ip_dri",this);
    h_ip_mon =ip_monitor::type_id::create("h_ip_mon",this);
  //  `uvm_info("Ip_agent ","Inside FIFO Ip_agent build Phase",UVM_MEDIUM)
  endfunction
  
  function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
    h_ip_dri.seq_item_port.connect(h_ip_seqr.seq_item_export);
  //  `uvm_info("Ip_agent ","Inside FIFO Ip_agent connect Phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
     super.run_phase(phase);
   // `uvm_info("Ip_agent ","Inside FIFO Ip_agent Run Phase",UVM_MEDIUM)
  endtask
  
endclass