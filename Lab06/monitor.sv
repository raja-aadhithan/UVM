class ram_wr_monitor extends uvm_monitor; // Extend ram_wr_monitor from uvm_monitor
        `uvm_component_utils(ram_wr_monitor) // Factory Registration
        virtual ram_if.WMON_MP vif;// Declare virtual interface handle with WMON_MP as modport
        ram_wr_agent_config m_cfg;// Declare the ram_wr_agent_config handle as "m_cfg"
        extern function new(string name = "ram_wr_monitor", uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern function void connect_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
        extern task collect_data();
endclass
function ram_wr_monitor::new(string name = "ram_wr_monitor", uvm_component parent);//  constructor new method
        super.new(name,parent);
endfunction
function void ram_wr_monitor::build_phase(uvm_phase phase); //  build() phase method
        super.build_phase(phase); // call super.build_phase(phase);
        if ( !uvm_config_db #(ram_wr_agent_config)::get(this,"","ram_wr_agent_config",m_cfg)) // get the config object using uvm_config_db
        `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db")
endfunction
function void ram_wr_monitor::connect_phase(uvm_phase phase); //  connect() phase method
        vif = m_cfg.vif;// in connect phase assign the configuration object's virtual interface
endfunction // to the monitor's virtual interface instance(handle --> "vif")
task ram_wr_monitor::run_phase(uvm_phase phase); //  run() phase method
        forever collect_data();// In forever loop Call task collect_data provided
endtask
task ram_wr_monitor::collect_data(); // Collect Reference Data from DUV IF
        write_xtn data_sent; // Create an instance data_sent
        data_sent= write_xtn::type_id::create("data_sent");
        @(posedge vif.wmon_cb.write);
        data_sent.write = vif.wmon_cb.write;
        data_sent.data = vif.wmon_cb.data_in;
        data_sent.address = vif.wmon_cb.wr_address;
        data_sent.xtn_type = (data_sent.address == 'd1904) ? BAD_XTN : GOOD_XTN ;
        `uvm_info("RAM_WR_MONITOR",$sformatf("printing from monitor \n %s", data_sent.sprint()),UVM_LOW)
endtask