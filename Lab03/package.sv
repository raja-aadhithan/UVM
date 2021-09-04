package ram_pkg;
        import uvm_pkg::*;      // import the UVM package
        `include "uvm_macros.svh"// include the uvm_macros.svh
        `include "tb_defs.sv"// include the tb_defs.sv
        `include "ram_wr_driver.sv"// include ram_wr_driver,ram_wr_agent,ram_env,ram_wr_test files
        `include "ram_wr_agent.sv"
        `include "ram_env.sv"
        `include "ram_wr_test.sv"
endpackage