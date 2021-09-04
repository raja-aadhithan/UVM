module top;
        import ram_test_pkg::*;// import ram_test_pkg
        import uvm_pkg::*;// import the UVM package
        `include "uvm_macros.svh"// include uvm_macros.svh file
        bit clock;  // Generate clock signal
        always #10 clock=!clock;
        ram_if in0(clock);// Instantiate ram_if with clock as input
        ram_chip ch(in0); // Instantiate rtl ram_chip and pass the interface instance as argument
        initial begin// In initial block
                uvm_config_db #(virtual ram_if)::set(null,"*","vif",in0);//set the virtual interface in to config database "vif" using the uvm_config_db
                run_test();// Call run_test
        end
endmodule