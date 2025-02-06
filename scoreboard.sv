class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  // DECLARATION
  `uvm_analysis_imp_decl(_ip_imp)
  `uvm_analysis_imp_decl(_op_imp)
  
   // IMPLEMENTATION
   uvm_analysis_imp_ip_imp #(seq_item,scoreboard) ip_mon2sb_imp_port;
   uvm_analysis_imp_op_imp #(seq_item,scoreboard) op_mon2sb_imp_port;
  
  seq_item ip_queue[$];
  seq_item op_queue[$];
  seq_item h_item;
  seq_item act_data;
  seq_item exp_data;
  
  int pass_count=0;
  int fail_count=0;
  
   function new(string name = "scoreboard",uvm_component parent);
    super.new(name, parent);
    // `uvm_info("Scoreboard ","Inside FIFO scoreboard new",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ip_mon2sb_imp_port = new("ip_mon2sb_imp_port",this);
    op_mon2sb_imp_port = new("op_mon2sb_imp_port",this);
   // `uvm_info("Scoreboard ","Inside FIFO scoreboard Build Phase",UVM_MEDIUM)
    //act_data=new();
    //exp_data=new();
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // `uvm_info("Scoreboard ","Inside FIFO scoreboard new",UVM_MEDIUM)
    //ip_mon2sb_imp_port.get()
  endfunction
  
  function void write_ip_imp(seq_item h_item);
    int a;
    a=h_item.data_in;
    $display("a=%0d",a);
   ip_queue.push_back(h_item);
  // `uvm_info("fifo_seq",$sformatf("Done generation in sequence => %p items",g_act_data_q),UVM_MEDIUM)
  endfunction
  
  function void write_op_imp(seq_item h_item);
  //  if(h_item.data_out>0) begin
    op_queue.push_back(h_item);
  //  end
   // `uvm_info("fifo_seq",$sformatf("=> %p items",g_exp_data_q),UVM_MEDIUM)
  endfunction
 

task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      compare();
    end
    //`uvm_info("scoreboard Class","Inside task run_phase",UVM_MEDIUM)
  endtask
  
  virtual task compare();
    act_data=new();
    exp_data=new();
    wait(ip_queue.size() > 0 );
    wait(op_queue.size() > 0 );
    act_data = op_queue.pop_front();
    exp_data = ip_queue.pop_front();
    if(exp_data.data_in == act_data.data_out)begin
      pass_count++;
      `uvm_info("COMPARE",$sformatf("PASSED,At time :%0t___exp_data = %0d is MATCHED with act_data = %0d\n",$time,exp_data.data_in,act_data.data_out),UVM_LOW)
    end
    else begin
      fail_count++;
      `uvm_info("COMPARE",$sformatf("FAILED,At time :%0t___exp_data = %0d is NOT  MATCHED with act_data = %0d\n",$time,exp_data.data_in,act_data.data_out),UVM_LOW)
    end
  endtask
  
  virtual function void report_phase(uvm_phase phase);
    `uvm_info("REPORT PHASE",$sformatf("Scoreboard results: Passed=%0d, Failed=%0d",pass_count,fail_count),UVM_NONE)
    if (fail_count<pass_count)begin
      `uvm_warning("REPORT PHASE",$sformatf("Test Passed with %0d matched",pass_count))
    end
    else begin
      `uvm_warning("REPORT PHASE",$sformatf("Test FAILED with %0d data matching",fail_count))
    end
  endfunction
  
endclass