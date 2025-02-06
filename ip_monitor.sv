class ip_monitor extends uvm_monitor;
  `uvm_component_utils(ip_monitor)
  seq_item h_item;
  virtual fifo_intf vif;
   uvm_analysis_port#(seq_item)  ip_mon2scbd;
   function new(string name = "ip_monitor",uvm_component parent);
    super.new(name, parent);
   //  `uvm_info("Ip_monitor ","Inside FIFO ip_monitor New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ip_mon2scbd = new("ip_mon2scbd",this);
   // `uvm_info("Ip_monitor ","InsideFIFO  ip_monitor Build Phase",UVM_MEDIUM)
     if(!uvm_config_db#(virtual fifo_intf)::get(this,"","intf1",vif)) begin
      `uvm_fatal("ip_driver","virtual intf instance not collected properly")
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // `uvm_info("Ip_monitor ","InsideFIFO  ip_monitor Connect Phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // `uvm_info("Ip_monitor ","Inside FIFO ip_monitor Run Phase",UVM_MEDIUM)
    
    forever begin
      @(posedge vif.clk); 
      if(vif.rst_n==1 && vif.wr==1 && vif.rd==0) begin
       h_item=seq_item::type_id::create("h_item");
       h_item.wr=vif.wr;
       h_item.rd=vif.rd;
       h_item.data_in=vif.data_in;   
      `uvm_info("fifo_seq",$sformatf("Packet in ip_monitor => %s items",h_item.sprint()),UVM_MEDIUM)
      //analysis port to scoreboard
      ip_mon2scbd.write(h_item);
      end
    end
    
  endtask
  
endclass