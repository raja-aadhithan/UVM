class ram_base_test extends uvm_test; // Extend ram_base_test from uvm_test;
        `uvm_component_utils(ram_base_test) // Factory Registration
        ram_env ram_envh;// Declare the ram_env and ram_wr_agent_config handles as ram_envh and m_ram_cfgass ram_even_addr_test extends ram_base_test;
        ram_wr_agent_config m_ram_cfg;
        extern function new(string name = "ram_base_test" , uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern function void config_ram();
endclass
function ram_base_test::new(string name = "ram_base_test",uvm_component parent); // constructor new method
        super.new(name,parent);// Define Constructor new() function
endfunction
function void ram_base_test::config_ram(); // config_ram() method
        m_ram_cfg.is_active = UVM_ACTIVE; // set is_active to UVM_ACTIVE
        if(!uvm_config_db #(virtual ram_if)::get(this,"","vif",m_ram_cfg.vif))// Get the virtual interface from the config database "vif"
        `uvm_fatal("VIF CONFIG","cannot get()")
endfunction
function void ram_base_test::build_phase(uvm_phase phase); // build() phase method
        m_ram_cfg = ram_wr_agent_config::type_id::create("m_ram_cfg");// Create the instance of ram_wr_agent_config
        config_ram();//call function config_ram()
        uvm_config_db #(ram_wr_agent_config)::set(this,"*","ram_wr_agent_config",m_ram_cfg);// set the config object into UVM config DB
        super.build_phase(phase);
        ram_envh=ram_env::type_id::create("ram_envh",this);// create the instance for ram_env

endfunction