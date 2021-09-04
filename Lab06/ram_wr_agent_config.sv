class ram_wr_agent_config extends uvm_object; // extend ram_wr_agent_config from uvm_object
        `uvm_object_utils(ram_wr_agent_config) // UVM Factory Registration Macro
        uvm_active_passive_enum is_active = UVM_ACTIVE;// Declare parameter is_active of type uvm_active_passive_enum and assign it to UVM_ACTIVE
        virtual ram_if vif;// Declare virtual interface handle for ram_if as vif
        extern function new(string name = "ram_wr_agent_config"); // Standard UVM Methods:

endclass: ram_wr_agent_config
function ram_wr_agent_config::new(string name = "ram_wr_agent_config");//constructor new method
        super.new(name);
endfunction