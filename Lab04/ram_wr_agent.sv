class ram_wr_agent extends uvm_agent; // Extend ram_wr_agent from uvm_agent
        `uvm_component_utils(ram_wr_agent)  // Factory Registration
        ram_wr_agent_config m_cfg;// Declare handle for configuration class ram_wr_agent_config
        ram_wr_monitor monh;// Declare handles of ram_wr_monitor,ram_wr_sequencer and ram_wr_driver
        ram_wr_sequencer seqrh;// with Handle names as monh, seqrh, drvh respectively
        ram_wr_driver drvh;
        // Standard UVM Methods :
        extern function new(string name = "ram_wr_agent", uvm_component parent = null);
        extern function void build_phase(uvm_phase phase);
        extern function void connect_phase(uvm_phase phase);
endclass : ram_wr_agent
function ram_wr_agent::new(string name = "ram_wr_agent", uvm_component parent = null);// constructor new method
        super.new(name,parent);
endfunction
function void ram_wr_agent::build_phase(uvm_phase phase);//build() phase method
        super.build_phase(phase);// Call parent build phase
        if(!uvm_config_db #(ram_wr_agent_config)::get(this,"","ram_wr_agent_config",m_cfg))// get the config object using uvm_config_db
                `uvm_fatal("CONFIG","cant get m_cfg from database")
        monh = ram_wr_monitor::type_id::create("monh",this);// Create ram_wr_monitor instance
        if(m_cfg.is_active == UVM_ACTIVE) begin//If config parameter is_active=UVM_ACTIVE,
                drvh = ram_wr_driver::type_id::create("drvh",this);// Create instance of driver and sequencer
                seqrh = ram_wr_sequencer::type_id::create("seqrh",this);
      end
endfunction
function void ram_wr_agent::connect_phase(uvm_phase phase);// connect() phase method
        if(m_cfg.is_active == UVM_ACTIVE) begin//If config parameter is_active=UVM_ACTIVE,
                drvh.seq_item_port.connect(seqrh.seq_item_export);//connect driver(TLM seq_item_port) and sequencer(TLM seq_item_export)
        end
endfunction