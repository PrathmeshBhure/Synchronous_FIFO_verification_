class op_monitor extends uvm_monitor;
  `uvm_component_utils(op_monitor)
  seq_item h_item;
  virtual fifo_intf vif;
  uvm_analysis_port#(seq_item)  op_mon2scbd;
  
   function new(string name = "op_monitor",uvm_component parent);
    super.new(name, parent);
   //  `uvm_info("Op_monitor ","Inside  FIFO  Op_monitor new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    op_mon2scbd = new("op_mon2scbd",this);
   // `uvm_info("Op_monitor ","Inside  FIFO Op_monitor Build Phase",UVM_MEDIUM)
     if(!uvm_config_db#(virtual fifo_intf)::get(this,"","intf1",vif)) begin
      `uvm_fatal("ip_driver","virtual intf instance not collected properly")
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  //  `uvm_info("Op_monitor ","Inside  FIFO Op_monitor Connect Phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // `uvm_info("Op_monitor ","Inside FIFO  Op_monitor Run Phase",UVM_MEDIUM)
    forever begin
       @(posedge vif.clk);
      if(vif.rst_n== 1 && vif.wr==0 && vif.rd==1 && vif.data_out>0 )//
        begin
       h_item=seq_item::type_id::create("h_item");
       h_item.data_out=vif.data_out;
       h_item.fifo_cnt=vif.fifo_cnt;
       h_item.full=vif.full;   
       h_item.empty=vif.empty;
      //analysis port to scoreboard
      `uvm_info("fifo_seq",$sformatf("Packet in op_monitor => %s items",h_item.sprint()),UVM_MEDIUM)
      op_mon2scbd.write(h_item);
        end
    end
  endtask
  
endclass