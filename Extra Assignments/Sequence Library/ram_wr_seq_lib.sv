class ram_wr_seq_lib extends uvm_sequence_library #(write_xtn);  // Extend ram_wr_seq_lib from uvm_sequence_library parameterized by write_xtn
        `uvm_object_utils(ram_wr_seq_lib) // Factory registration using `uvm_object_utils
        `uvm_sequence_library_utils(ram_wr_seq_lib)
        extern function new(string name ="ram_wbase_seq"); // Standard UVM Methods:
endclass
function ram_wr_seq_lib::new(string name ="ram_wbase_seq"); // constructor new method
        super.new(name);
        add_typewide_sequences({ram_rand_wr_xtns::get_type(),//add ram_rand_wr_xtns,ram_single_addr_wr_xtns to sequence library using the method add_typewide_sequences
                                ram_single_addr_wr_xtns::get_type()});// call the method init_sequence_library
        init_sequence_library();
endfunction