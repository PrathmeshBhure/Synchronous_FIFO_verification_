class op_agent extends uvm_agent;
  `uvm_component_utils(op_agent)
   op_monitor	h_op_mon;
  
  function new(string name = "op_agent",uvm_component parent);
    super.new(name, parent);
   // `uvm_info("Op_agent ","Inside FIFO Op_agent New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  //  `uvm_info("Op_agent ","InsideFIFO  Op_agent Build Phase",UVM_MEDIUM)
    h_op_mon = op_monitor::type_id::create("h_op_mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // `uvm_info("Op_agent ","Inside FIFO Op_agent Connect Phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // `uvm_info("Op_agent ","Inside FIFO Op_agent Run Phase",UVM_MEDIUM)
  endtask
  
endclass