class ram_env extends uvm_env; // Extend ram_env from uvm_env
        `uvm_component_utils(ram_env) // Factory Registration
        ram_wr_agent wr_agnth; // Declare the ram_wr_agent handle with handle name as wr_agnth
        extern function new(string name = "ram_env",uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
endclass
function ram_env::new(string name = "ram_env", uvm_component parent);//-----------------  constructor new method  -------------------//
        super.new(name,parent);
endfunction
function void ram_env::build_phase(uvm_phase phase);    //  Add UVM build() phase
        super.build_phase(phase);
        wr_agnth = ram_wr_agent::type_id::create("wr_agnth",this);//Create the instance of agent in the build phase
        `uvm_info("RAM_ram_env","this is build phase of ram_env", UVM_LOW)
endfunction