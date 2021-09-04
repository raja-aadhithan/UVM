module top;
        import ram_pkg::*; //import ram_pkg.sv
        import uvm_pkg::*;// import the UVM package
        `include "uvm_macros.svh" // include the uvm_macros.svh
        initial begin //Within initial block call run_test("ram_wr_test")
                run_test("ram_wr_test");
        end
endmodule : top