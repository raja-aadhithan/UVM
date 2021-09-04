class ram_base_test extends uvm_test; // Extend ram_base_test from uvm_test;
        `uvm_component_utils(ram_base_test)  // Factory Registration
        ram_env ram_envh; // Declare the ram_env and ram_wr_agent_config handles
        ram_wr_agent_config m_ram_cfg;
        extern function new(string name = "ram_base_test" , uvm_component parent);// Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
 endclass
function ram_base_test::new(string name = "ram_base_test" , uvm_component parent); // constructor new method
        super.new(name,parent); // Define Constructor new() function
endfunction
function void ram_base_test::build_phase(uvm_phase phase); //  build() phase method
        m_ram_cfg=ram_wr_agent_config::type_id::create("m_ram_cfg");// Create the instance of config_object
        m_ram_cfg.is_active = UVM_ACTIVE; // set is_active to UVM_ACTIVE
        uvm_config_db #(ram_wr_agent_config)::set(this,"*","ram_wr_agent_config",m_ram_cfg);// set the config object into UVM config DB
        super.build_phase(phase);
        ram_envh=ram_env::type_id::create("ram_envh", this);// create the instance for env
endfunction
class ram_seq_lib_test extends ram_base_test; // Extend ram_seqr_arb_test from ram_base_test;
        `uvm_component_utils(ram_seq_lib_test) // Factory Registration
        extern function new(string name = "ram_seq_lib_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
        extern function void end_of_elaboration_phase(uvm_phase phase);
endclass
function ram_seq_lib_test::new(string name = "ram_seq_lib_test" , uvm_component parent); //constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_seq_lib_test::build_phase(uvm_phase phase); // build() phase method
        super.build_phase(phase);
endfunction
function void ram_seq_lib_test::end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();// print the topology
endfunction
task ram_seq_lib_test::run_phase(uvm_phase phase); // run() phase method
        ram_wr_seq_lib seq_lib = ram_wr_seq_lib::type_id::create("seq_lib");//Declare the handle of sequence library & create the instance
        phase.raise_objection(this); //raise objection
        seq_lib.add_sequence(ram_even_wr_xtns::get_type());// add write even sequence to seqeunce library using add_sequence method
        seq_lib.selection_mode = UVM_SEQ_LIB_RANDC;//Set the library mode to RANDC mode
        seq_lib.min_random_count = 5;//set min_random_count & max_random_count of sequence library to 5 & 15
        seq_lib.max_random_count = 15;
        assert(seq_lib.randomize());// randomize the sequence library
        seq_lib.start(ram_envh.wr_agnth.seqrh);// start the sequence library on agent sequencer
        phase.drop_objection(this);
endtask