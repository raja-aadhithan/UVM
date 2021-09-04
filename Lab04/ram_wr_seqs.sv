class ram_wbase_seq extends uvm_sequence #(write_xtn);  // Extend ram_wbase_seq from uvm_sequence parameterized by write_xtn
        `uvm_object_utils(ram_wbase_seq)// Factory registration using `uvm_object_utils
        extern function new(string name ="ram_wbase_seq");// Standard UVM Methods:
endclass
function ram_wbase_seq::new(string name ="ram_wbase_seq");// Standard UVM Methods:
        super.new(name);
endfunction
class ram_rand_wr_xtns extends ram_wbase_seq; //Extend ram_rand_wr_xtns from ram_wbase_seq;
        `uvm_object_utils(ram_rand_wr_xtns) // Factory registration using `uvm_object_utils
        extern function new(string name ="ram_rand_wr_xtns"); // Standard UVM Methods
        extern task body();
endclass
function ram_rand_wr_xtns::new(string name = "ram_rand_wr_xtns");
        super.new(name);
endfunction
task ram_rand_wr_xtns::body(); //task body method
        repeat(10) begin //Generate 10 transactions of type write_xtn
        req = write_xtn::type_id::create("req");//create req instance
        start_item(req);//start_item(req)
        assert(req.randomize());//assert for randomization
        finish_item(req);//finish_item(req)
        end
endtask