class ram_base_test extends uvm_test; // Extend ram_base_test from uvm_test;
        `uvm_component_utils(ram_base_test) // Factory Registration
        ram_env ram_envh; // Declare the ram_env and ram_wr_agent_config handles as ram_envh and m_ram_cfg respectively
        ram_wr_agent_config m_ram_cfg;
        extern function new(string name = "ram_base_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
 endclass
function ram_base_test::new(string name = "ram_base_test" , uvm_component parent); //constructor new method
        super.new(name,parent); // Define Constructor new() function
endfunction
function void ram_base_test::build_phase(uvm_phase phase); //build() phase method
        m_ram_cfg=ram_wr_agent_config::type_id::create("m_ram_cfg"); // Create the instance of config_object
        m_ram_cfg.is_active = UVM_ACTIVE; // set is_active to UVM_ACTIVE
        uvm_config_db #(ram_wr_agent_config)::set(this,"*","ram_wr_agent_config",m_ram_cfg); // set the config object into UVM config DB
        super.build_phase(phase);
        ram_envh=ram_env::type_id::create("ram_envh", this); // create the instance for env
endfunction

class ram_single_addr_test extends ram_base_test; // Extend ram_single_addr_test from ram_base_test;
        `uvm_component_utils(ram_single_addr_test) // Factory Registration
        ram_single_addr_wr_xtns ram_seqh;//Declare the handle for  ram_single_addr_wr_xtns sequence
        extern function new(string name = "ram_single_addr_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
endclass
function ram_single_addr_test::new(string name = "ram_single_addr_test", uvm_component parent);// constructor new method
        super.new(name,parent); // Define Constructor new() function
endfunction
function void ram_single_addr_test::build_phase(uvm_phase phase);// build() phase method
        super.build_phase(phase); // call build phase of ram_base_test
endfunction
task ram_single_addr_test::run_phase(uvm_phase phase); //run() phase method
        phase.raise_objection(this);//raise objection
        ram_seqh = ram_single_addr_wr_xtns::type_id::create("ram_seqh");//create instance for sequence
        ram_seqh.start(ram_envh.wr_agnth.seqrh);//start the sequence on write agent sequencer
        phase.drop_objection(this);//drop objection
endtask

class ram_ten_addr_test extends ram_base_test; // Extend ram_ten_addr_test from ram_base_test;
        `uvm_component_utils(ram_ten_addr_test) // Factory Registration
        ram_ten_wr_xtns ram_seqh;// Declare the handle for  ram_ten_wr_xtns sequence
        extern function new(string name = "ram_ten_addr_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
endclass
function ram_ten_addr_test::new(string name = "ram_ten_addr_test", uvm_component parent);// constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_ten_addr_test::build_phase(uvm_phase phase);//  build() phase method
        super.build_phase(phase);// call build phase of ram_base_test
endfunction
task ram_ten_addr_test::run_phase(uvm_phase phase); // run() phase method
        phase.raise_objection(this);//raise objection
        ram_seqh = ram_ten_wr_xtns::type_id::create("ram_seqh"); //create instance for sequence
        ram_seqh.start(ram_envh.wr_agnth.seqrh); //start the sequence on write agent sequencer
        phase.drop_objection(this);//drop objection
endtask
class ram_odd_addr_test extends ram_base_test; // Extend ram_odd_addr_test from ram_base_test;
        `uvm_component_utils(ram_odd_addr_test) // Factory Registration
        ram_odd_wr_xtns ram_seqh;// Declare the handle for  ram_odd_wr_xtns sequence
        extern function new(string name = "ram_odd_addr_test" , uvm_component parent);// Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
endclass
function ram_odd_addr_test::new(string name = "ram_odd_addr_test", uvm_component parent);// constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_odd_addr_test::build_phase(uvm_phase phase);//  build() phase method
        super.build_phase(phase);// call build phase of ram_base_test
endfunction
task ram_odd_addr_test::run_phase(uvm_phase phase); //run() phase method
        phase.raise_objection(this);//raise objection
        ram_seqh = ram_odd_wr_xtns::type_id::create("ram_seqh"); //create instance for sequence
        ram_seqh.start(ram_envh.wr_agnth.seqrh); //start the sequence on write agent sequencer
        phase.drop_objection(this); //drop objection
endtask

class ram_even_addr_test extends ram_base_test; // Extend ram_even_addr_test from ram_base_test;
        `uvm_component_utils(ram_even_addr_test) // Factory Registration
        ram_even_wr_xtns ram_seqh;// Declare the handle for  ram_even_wr_xtns sequence
        extern function new(string name = "ram_even_addr_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
endclass
function ram_even_addr_test::new(string name = "ram_even_addr_test", uvm_component parent);//constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_even_addr_test::build_phase(uvm_phase phase); //build() phase method
        super.build_phase(phase);// call build phase of ram_base_test
endfunction
task ram_even_addr_test::run_phase(uvm_phase phase); //run() phase method
        phase.raise_objection(this);//raise objection
        ram_seqh = ram_even_wr_xtns::type_id::create("ram_seqh");//create instance for sequence
        ram_seqh.start(ram_envh.wr_agnth.seqrh);//start the sequence on write agent sequencer
        phase.drop_objection(this);//drop objection
endtask