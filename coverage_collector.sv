class coverage_collector extends uvm_subscriber#(seq_item);
  `uvm_component_utils(coverage_collector)
  seq_item h_item;
  
  covergroup cg_fifo;
    cp_wr: coverpoint h_item.wr{bins b1[1]={[0:1]};}
    cp_rd: coverpoint h_item.rd{bins b2[1]={[0:1]};}
    cp_data_in: coverpoint h_item.data_in{bins b1[8]={[0:255]};}
    cp_data_out: coverpoint h_item.data_out{bins b1[8]={[0:255]};}
    cp_full: coverpoint h_item.full{bins b5[1]={[0:1]};}
    cp_empty: coverpoint h_item.empty{bins b6[1]={[0:1]};}
  endgroup
  
  function new(string name="coverage_collector",uvm_component parent);
    super.new(name,parent);
    cg_fifo=new();
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  //   `uvm_info("Scoreboard ","Inside scoreboard new",UVM_MEDIUM)
  endfunction
  
  virtual function void write(seq_item t);
    h_item=t;
    cg_fifo.sample();
    `uvm_info("coverage_collector",$sformatf("the functional coverage is:%d",cg_fifo.get_coverage),UVM_MEDIUM)
  endfunction
  
endclass

