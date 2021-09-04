class short_xtn extends write_xtn;// Extend short_xtn from write_xtn
        `uvm_object_utils(short_xtn)// UVM Factory Registration Macro
        constraint limit{address inside {[0:15]};} // Override Constraint for address such that it generates address to access only the first 16 locations of the memory
        extern function new(string name = "short_xtn");
endclass
function short_xtn::new(string name = "short_xtn");
        super.new(name);
endfunction