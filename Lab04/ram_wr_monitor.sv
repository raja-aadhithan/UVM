class ram_wr_monitor extends uvm_monitor; // Extend ram_wr_monitor from uvm_monitor
        `uvm_component_utils(ram_wr_monitor)  // Factory Registration
        // Standard UVM Methods :
        extern function new(string name = "ram_wr_monitor", uvm_component parent);
        extern task run_phase(uvm_phase phase);
endclass
function ram_wr_monitor::new(string name = "ram_wr_monitor", uvm_component parent);
        super.new(name,parent);
endfunction
task ram_wr_monitor::run_phase(uvm_phase phase);//  run() phase method
        `uvm_info("MONITOR","This is MONITOR in run",UVM_LOW)//Print info message “This is write monitor run_phase”
endtask