class ram_wr_driver extends uvm_driver #(write_xtn); // Extend ram_wr_driver from uvm_driver parameterized by write_xtn
        `uvm_component_utils(ram_wr_driver)// Factory Registration
        virtual ram_if.WDR_MP vif;// Declare virtual interface handle with WDR_MP as modport
        ram_wr_agent_config m_cfg;// Declare the ram_wr_agent_config handle as "m_cfg"
        extern function new(string name ="ram_wr_driver",uvm_component parent); // Standard UVM Methods:
        extern function void build_phase(uvm_phase phase);
        extern function void connect_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
        extern task send_to_dut(write_xtn xtn);
endclass
function ram_wr_driver::new(string name = "ram_wr_driver", uvm_component parent);// Define Constructor new() function
        super.new(name,parent);
endfunction
function void ram_wr_driver::build_phase(uvm_phase phase); // build() phase method
        super.build_phase(phase);// call super.build_phase(phase);
        if(!uvm_config_db #( ram_wr_agent_config)::get(this,"","ram_wr_agent_config",m_cfg))// get the config object using uvm_config_db
        `uvm_fatal("CONFIG","cannot get()")
endfunction
function void ram_wr_driver::connect_phase(uvm_phase phase); //  connect() phase method
        vif = m_cfg.vif;// in connect phase assign the configuration object's virtual interface
endfunction // to the driver's virtual interface instance(handle --> "vif")
task ram_wr_driver::run_phase(uvm_phase phase); //  run() phase method
        forever begin// In forever loop
                seq_item_port.get_next_item(req);// Get the sequence item using seq_item_port
                send_to_dut(req);// Call send_to_dut task provided
                seq_item_port.item_done();// send acknowledgment to sequencer
        end
endtask
task ram_wr_driver::send_to_dut(write_xtn xtn); //  task send_to_dut() method
// Add task send_to_dut(write_xtn handle as an input argument)
        `uvm_info("RAM_WR_DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW)  // Print the transaction
        repeat(2) @(vif.wdr_cb);// Add the write logic
        vif.wdr_cb.wr_address <= xtn.address;// Driving XTN
        vif.wdr_cb.write <= xtn.write;
        vif.wdr_cb.data_in <= xtn.data;
        @(vif.wdr_cb);// Removing data
        vif.wdr_cb.wr_address <= '0;
        vif.wdr_cb.write <= '0;
        vif.wdr_cb.data_in <= '0;
        repeat(5)  @(vif.wdr_cb);
        repeat(5)  @(vif.wdr_cb);
endtask