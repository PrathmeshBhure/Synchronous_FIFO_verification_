package fifo_pkg;

`include "uvm_macros.svh" 
import uvm_pkg::*;

`include "seq_item.sv"
`include "op_monitor.sv"
`include "ip_monitor.sv"
`include "fifo_driver.sv"
`include "fifo_ip_seqr.sv"
`include "op_agent.sv"
`include "ip_agent.sv"
`include "coverage_collector.sv"
`include "scoreboard.sv"
`include "fifo_vseqr.sv"
`include "fifo_env.sv"
 `include "fifo_seq.sv"
`include "fifo_vseq.sv"
 `include "fifo_test.sv"

endpackage: fifo_pkg