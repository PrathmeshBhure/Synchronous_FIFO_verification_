class seq_item extends uvm_sequence_item;
// `uvm_object_utils(seq_item)
  
  rand bit [7:0]data_in;
  rand bit wr;
  rand bit  rd;
  bit  empty;
  bit  full;
  bit  [3:0]fifo_cnt;
  bit  [7:0] data_out;
  
  //Utility and Field macros
  //---------------------------------------
  
   `uvm_object_utils_begin(seq_item)
  `uvm_field_int(data_in, UVM_ALL_ON)
  `uvm_field_int(rd, UVM_ALL_ON)
  `uvm_field_int(wr, UVM_ALL_ON)
  `uvm_field_int(full, UVM_ALL_ON)
  `uvm_field_int(empty, UVM_ALL_ON)
  `uvm_field_int(data_out, UVM_ALL_ON)
  `uvm_object_utils_end
  
   //`uvm_field_int(d,UVM_ALL_ON)
   //`uvm_field_int(q,UVM_ALL_ON)
   //`uvm_object_utils_end
  
  function new(string name = "seq_item");
    super.new(name);
 //   `uvm_info("SEQ_Item","Inside FIFO SEQ_item NEW ",UVM_MEDIUM)
    //convert2string();
  endfunction
  
//   constraint c1{data_in>0;}
   constraint c2{rd!=wr;}

//    function string convert2string();
//     return $psprintf("data_in=%0h,data_out=%0h,wr=%0d,rd=%0d,full=%od,empty=%0d",data_in,data_out,wr,rd,full,empty);
//   endfunction
  
endclass