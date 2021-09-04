module top;
        import uvm_pkg::*;
        import ram_pkg::*;// import the  ram_pkg
        write_xtn wr_xtnh;// Declare handle for write_xtn as wr_xtnh
        // Add build method
        function void build();
                wr_xtnh = write_xtn::type_id::create("wr_xtnh");  // Create an instance of wr_xtnh using factory create()
                assert(wr_xtnh.randomize());  // Randomize and print the transactions
                wr_xtnh.print();
        endfunction
        // Within initial
        initial begin
                repeat(5) build();      // Call build function 5 times (Without Overriding)
                factory.set_type_override_by_type(write_xtn::get_type,short_xtn::get_type);//call factory overriding method Hint : Use factory.set_type_override_by_type Override
                repeat(5) build();// Call build function 5 times
        end
endmodule