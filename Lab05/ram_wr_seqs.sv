class ram_wbase_seq extends uvm_sequence #(write_xtn);  // Extend ram_wbase_seq from uvm_sequence parameterized by write_xtn
        `uvm_object_utils(ram_wbase_seq)// Factory registration using `uvm_object_utils
        extern function new(string name ="ram_wbase_seq"); // Standard UVM Methods:
endclass
function ram_wbase_seq::new(string name ="ram_wbase_seq"); // constructor new method
        super.new(name);
endfunction

class ram_rand_wr_xtns extends ram_wbase_seq; //Extend ram_rand_wr_xtns from ram_wbase_seq;
        `uvm_object_utils(ram_rand_wr_xtns) // Factory registration using `uvm_object_utils
        extern function new(string name ="ram_rand_wr_xtns");// Standard UVM Methods:
        extern task body();
endclass
function ram_rand_wr_xtns::new(string name = "ram_rand_wr_xtns"); //constructor new method
        super.new(name);
endfunction
task ram_rand_wr_xtns::body();// task body method
        repeat(10) begin //Generate 10 transactions of type write_xtn
                req = write_xtn::type_id::create("req");//create req instance
                start_item(req);//start_item(req)
                assert(req.randomize());//assert for randomization
                finish_item(req);//finish_item(req)
        end
endtask
// SEQUENCE: Ram Single address Write Transactions
class ram_single_addr_wr_xtns extends ram_wbase_seq; // Extend ram_single_addr_wr_xtns from ram_wbase_seq;
        `uvm_object_utils(ram_single_addr_wr_xtns)// Factory registration using `uvm_object_utils
        extern function new(string name ="ram_single_addr_wr_xtns"); // Standard UVM Methods
        extern task body();
endclass
function ram_single_addr_wr_xtns::new(string name ="ram_single_addr_wr_xtns"); // constructor new method
        super.new(name);
endfunction
task ram_single_addr_wr_xtns::body(); // task body method
        repeat(10) begin// Generate 10 sequence items with address always equal to 55
                req = write_xtn::type_id::create("req");// Hint use create req, start item, assert for randomization with inline
                start_item(req);
                assert(req.randomize() with { address == 55;}); // constraint (with) finish item inside repeat's begin end block
                finish_item(req);
        end
endtask

// SEQUENCE: Ram ten Write Transactions
class ram_ten_wr_xtns extends ram_wbase_seq; // Extend ram_ten_wr_xtns from ram_wbase_seq;
        `uvm_object_utils(ram_ten_wr_xtns) // Factory registration using `uvm_object_utils
        extern function new(string name ="ram_ten_wr_xtns"); // Standard UVM Methods
        extern task body();
endclass
function ram_ten_wr_xtns::new(string name = "ram_ten_wr_xtns"); // constructor new method
        super.new(name);
endfunction
task ram_ten_wr_xtns::body(); // task body method
        int ax = 0;
        repeat(10) begin // Write the random data on memory address locations consecutively from 0 to 9
                req = write_xtn::type_id::create("req"); // Hint use create req, start item, assert for randomization with in line
                start_item(req);//  constraint (with) finish item inside for loop begin end block
                assert(req.randomize() with {address==ax; write==1'b1;});
                finish_item(req);
                ax = ax + 1;
        end
endtask
// SEQUENCE: Ram odd Write Transactions
class ram_odd_wr_xtns extends ram_wbase_seq; // Extend ram_odd_wr_xtns from ram_wbase_seq;
        `uvm_object_utils(ram_odd_wr_xtns) // Factory registration using `uvm_object_utils
        extern function new(string name ="ram_odd_wr_xtns"); // Standard UVM Methods:
        extern task body();
endclass
function ram_odd_wr_xtns::new(string name = "ram_odd_wr_xtns"); // constructor new method
        super.new(name);
endfunction
task ram_odd_wr_xtns::body(); // task body method
        repeat(10) begin // write the 10 random data in odd memory address locations
                req = write_xtn::type_id::create("req");// Hint use create req, start item, assert for randomization with in line
                start_item(req); // constraint  (with) finish item inside repeat's begin end block
                assert(req.randomize() with {address%2 == 1; write == 1'b1;});
                finish_item(req);
        end
endtask
// SEQUENCE: Ram even Write Transactions
class ram_even_wr_xtns extends ram_wbase_seq;
        `uvm_object_utils(ram_even_wr_xtns) // Factory registration using `uvm_object_utils
        extern function new(string name ="ram_even_wr_xtns"); // Standard UVM Methods:
        extern task body();
endclass
function ram_even_wr_xtns::new(string name ="ram_even_wr_xtns"); // constructor new method
        super.new(name);
endfunction
task ram_even_wr_xtns::body(); // task body method
        repeat(10) begin// write the 10 random data in even memory address locations
                req = write_xtn::type_id::create("req");// Hint use create req, start item, assert for randomization with in line
                start_item(req);// constraint (with) finish item inside repeat's begin end block
                assert(req.randomize() with {address%2 == 0; write == 1'b1;});
                finish_item(req);
        end
endtask