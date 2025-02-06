class fifo_driver extends uvm_driver #(seq_item);
  `uvm_component_utils(fifo_driver)
  virtual fifo_intf vif;
   seq_item h_item;
  
  function new(string name = "fifo_driver",uvm_component parent);
    super.new(name, parent);
    // `uvm_info("IP_Driver","Inside FIFO  IP_Driver New ",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //  `uvm_info("IP_Driver","Inside FIFO IP_Driver Build Phase ",UVM_MEDIUM) //
    if(!uvm_config_db#(virtual fifo_intf)::get(this,"","intf1",vif)) begin
      `uvm_fatal("ip_driver","virtual intf instance not collected properly")
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // `uvm_info("IP_Driver","Inside  FIFO IP_Driver Connect Phase ",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  //  `uvm_info("IP_Driver","Inside  FIFO IP_Driver Run Phase ",UVM_MEDIUM)
     wait(vif.rst_n ==1);
        forever begin
          seq_item_port.get_next_item(h_item);
           drive_transfer(h_item);
          `uvm_info("fifo_seq",$sformatf("Packet in driver => %s items",h_item.sprint()),UVM_MEDIUM)
            seq_item_port.item_done();
            @(posedge vif.clk);
        end
  endtask
  
  task drive_transfer(seq_item h_item);
     vif.wr <= h_item.wr;
     vif.rd <= h_item.rd;
     vif.data_in <= h_item.data_in;        
    // vif.fifo_cnt <= h_item.fifo_cnt;
  //  vif.data_out <= h_item.data_out;
  endtask
  
  
endclass