// VSEQ //
class fifo_vseq extends uvm_sequence;
  `uvm_object_utils(fifo_vseq)
  `uvm_declare_p_sequencer(fifo_vseqr);
  wr_rd_seq 	    h_wr_rd_seq;
  alt_wr_rd_seq 	h_alt_wr_rd_seq;
  mul_wr_seq        h_mul_wr_seq;
  mul_rd_seq       h_mul_rd_seq ;
  roll_over_seq    h_roll_over_seq;
  random_seq       h_random_seq;
  
  function new(string name ="fifo_vseq");
    super.new(name);
   // `uvm_info("VSEQ","Inside FIFO VSEQ NEW ",UVM_MEDIUM)
  endfunction
  
  virtual task body();
   // start_item(h_seq);
   // `uvm_info("Virtual sequence", "Inside virtual sequence", UVM_NONE)
	h_wr_rd_seq = wr_rd_seq :: type_id :: create("h_wr_rd_seq");
     h_wr_rd_seq.start(p_sequencer.h_ip_seqr);
    
    h_mul_wr_seq = mul_wr_seq :: type_id :: create("h_mul_wr_seq");
     h_mul_wr_seq.start(p_sequencer.h_ip_seqr);
    
   h_mul_rd_seq = mul_rd_seq :: type_id :: create("h_mul_rd_seq");
      h_mul_rd_seq.start(p_sequencer.h_ip_seqr);
    
     h_roll_over_seq = roll_over_seq :: type_id :: create("h_roll_over_seq");
      h_roll_over_seq.start(p_sequencer.h_ip_seqr);
    
    
     h_alt_wr_rd_seq = alt_wr_rd_seq :: type_id :: create("h_alt_wr_rd_seq");
    h_alt_wr_rd_seq.start(p_sequencer.h_ip_seqr);
    

    
 h_random_seq = random_seq :: type_id :: create("h_random_seq");
   h_random_seq.start(p_sequencer.h_ip_seqr);
  endtask

      
//  function string convert2string();
//     return $psprintf("data_in=%0h,datjavascript:void(0)a_out=%0h,wr=%0d,rd=%0d,full=%od,empty=%0d",data_in,data_out,wr,rd,full,empty);
//   endfunction
      



 
  
  
  
endclass