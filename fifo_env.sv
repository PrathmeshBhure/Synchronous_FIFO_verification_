class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)
  fifo_vseqr		h_vseqr;
  ip_agent		h_ip_agent;
  op_agent		h_op_agent;
  scoreboard	h_scbd;
  coverage_collector h_coverage_collector;
  
  function new(string name = "fifo_env",uvm_component parent);
    super.new(name, parent);
   // `uvm_info("Env ","Inside FIFO Env  New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //`uvm_info("Env ","Inside FIFO Env Build Phase",UVM_MEDIUM)
    h_vseqr = fifo_vseqr::type_id::create("h_vseqr",this);
    h_ip_agent =ip_agent::type_id::create("h_ip_agent",this);
    h_op_agent = op_agent::type_id::create("h_op_agent",this);
    h_scbd		= scoreboard::type_id::create("h_scbd",this);
    h_coverage_collector= coverage_collector::type_id::create("h_coverage_collector",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  //  `uvm_info("Env ","Inside FIFO Env Connect Phase",UVM_MEDIUM)
    h_vseqr.h_ip_seqr = h_ip_agent.h_ip_seqr;
    h_ip_agent.h_ip_mon.ip_mon2scbd.connect(h_scbd.ip_mon2sb_imp_port);
    h_op_agent.h_op_mon.op_mon2scbd.connect(h_scbd.op_mon2sb_imp_port);
    
    h_ip_agent.h_ip_mon.ip_mon2scbd.connect(h_coverage_collector.analysis_export);
    h_op_agent.h_op_mon.op_mon2scbd.connect(h_coverage_collector.analysis_export);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // `uvm_info("Env ","Inside FIFO Env Run Phase",UVM_MEDIUM)
  endtask
  
  
endclass