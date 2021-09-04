class ram_rd_agent_config extends uvm_object;
        `uvm_object_utils(ram_rd_agent_config) // UVM Factory Registration Macro
        virtual ram_if vif; // Declare the virtual interface handle for ram_if as "vif"
        uvm_active_passive_enum is_active = UVM_ACTIVE; // Declare parameter is_active of type uvm_active_passive_enum and assign it to UVM_ACTIVE
        static int mon_rcvd_xtn_cnt = 0; // Declare the mon_rcvd_xtn_cnt as static int and initialize it to zero
        static int drv_data_sent_cnt = 0; // Declare the drv_data_sent_cnt as static int and initialize it to zero
        extern function new(string name = "ram_rd_agent_config");  // Standard UVM Methods:
endclass: ram_rd_agent_config
function ram_rd_agent_config::new(string name = "ram_rd_agent_config");
  super.new(name);
endfunction