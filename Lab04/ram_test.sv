class ram_base_test extends uvm_test; // Extend ram_base_test from uvm_test;
        `uvm_component_utils(ram_base_test)// Factory Registration
        ram_env ram_envh;// Declare the ram_env and ram_wr_agent_config handles as ram_envh and m_ram_cfg respectively
        ram_wr_agent_config m_ram_cfg;
        // Standard UVM Methods:
        extern function new(string name = "ram_base_test" , uvm_component parent);
        extern function void build_phase(uvm_phase phase);
endclass
function ram_base_test::new(string name = "ram_base_test", uvm_component parent);//constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_base_test::build_phase(uvm_phase phase); // build() phase method
        m_ram_cfg = ram_wr_agent_config::type_id::create("m_ram_cfg");// Create the instance of config_object
        m_ram_cfg.is_active = UVM_ACTIVE;// set is_active to UVM_ACTIVE
        uvm_config_db #(ram_wr_agent_config)::set(this,"*","ram_wr_agent_config",m_ram_cfg);// set the config object into UVM config DB
        super.build_phase(phase);
        ram_envh = ram_env::type_id::create("ram_envh",this);// create the instance for env
endfunction

class ram_random_test extends ram_base_test; // Extend ram_random_test from ram_base_test;
        `uvm_component_utils(ram_random_test)// Factory Registration
        ram_rand_wr_xtns ram_seqh;// Declare the handle for  ram_rand_wr_xtns sequence
        // Standard UVM Methods:
        extern function new(string name = "ram_random_test" , uvm_component parent);
        extern function void build_phase(uvm_phase phase);
        extern function void end_of_elaboration_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
endclass
function ram_random_test :: new(string name = "ram_random_test" , uvm_component parent);// constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_random_test::build_phase(uvm_phase phase);//build() phase method
        super.build_phase(phase);// In build phase call build phase of ram_base_test
endfunction
function void ram_random_test::end_of_elaboration_phase(uvm_phase phase);//end_of_elobration() phase method
        uvm_top.print_topology();// print topology
endfunction
task ram_random_test::run_phase(uvm_phase phase); //run() phase method
        phase.raise_objection(this);//raise objection
        ram_seqh = ram_rand_wr_xtns::type_id::create("ram_seqh");//create instance for sequence
        ram_seqh.start(ram_envh.wr_agnth.seqrh);//start the sequence on write agent sequencer
        phase.drop_objection(this);//drop objection
endtask