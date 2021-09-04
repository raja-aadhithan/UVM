module top;
        import ram_test_pkg::*;// import ram_test_pkg
        import uvm_pkg::*;// import the UVM package
        `include "uvm_macros.svh" // include the uvm_macros.svh
        initial begin// Within initial begin
                run_test(); // Call run_test()
        end
endmodule : top