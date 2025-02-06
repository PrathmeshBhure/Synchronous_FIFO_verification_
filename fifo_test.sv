class fifo_test extends uvm_test;
  `uvm_component_utils(fifo_test)
  fifo_env h_env;
  fifo_vseq	h_vseq;
  wr_rd_seq	h_wr_rd_seq;
  
  function new(string name = "fifo_test",uvm_component parent);
    super.new(name,parent);
    //`uvm_info("Test ","Inside FIFO Test New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    h_env=fifo_env::type_id::create("h_env",this);
     h_vseq = fifo_vseq::type_id::create("h_vseq");
    h_wr_rd_seq=wr_rd_seq::type_id::create("h_wr_rd_seq");
   // `uvm_info("Test ","Inside FIFO Test Build Phase",UVM_MEDIUM)
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // `uvm_info("Test ","Inside FIFO Test Connect Phase",UVM_MEDIUM)
  endfunction
  
   function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  //   `uvm_info("Test ","Inside FIFO Test end_of_elaboration Phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   `uvm_info("Test ","Inside FIFO Test Run Phase",UVM_MEDIUM)
    phase.raise_objection(this);
    // start vseq on vseqr //
   // $display("%t Starting sequence fifo_seq run_phase",$time);
    h_vseq.start(h_env.h_vseqr);
   // h_seq.start(h_env. h_op_agent.h_op_seqr);
   // h_vseq.start(h_seq);
    #100;
    phase.drop_objection(this);
  endtask
  
  
  
endclass