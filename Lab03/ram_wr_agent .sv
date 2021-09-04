class ram_wr_agent extends uvm_agent;
        `uvm_component_utils(ram_wr_agent)   // Factory Registration
        ram_wr_driver ram_drh;//Declare the ram_wr_driver handle

        //Add all the UVM phases
        extern function new(string name = "ram_wr_agent",uvm_component parent);
        extern function void build_phase(uvm_phase phase);
        extern function void connect_phase(uvm_phase phase);
        extern function void end_of_elaboration_phase(uvm_phase phase);
        extern function void start_of_simulation_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
        extern function void extract_phase(uvm_phase phase);
        extern function void check_phase(uvm_phase phase);
        extern function void report_phase(uvm_phase phase);

endclass


//-----------------  constructor new method  -------------------//
function ram_wr_agent::new(string name="ram_wr_agent",uvm_component parent);
        super.new(name,parent);
endfunction

// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc
//        Print using `uvm_info("RAM_AGENT","This is build phase",UVM_LOW)  in all the phases

//-----------------  Add UVM build() phase   -------------------//
// In build phase create the instance of driver
function void ram_wr_agent::build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Create the instance of driver in the build phase
        ram_drh=ram_wr_driver::type_id::create("ram_drh",this);
        `uvm_info("RAM_WR_AGENT","THIS IS BUILD IN AGENT",UVM_LOW)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS CONNECT PHASE IN AGENT",UVM_LOW);
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_agent::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS END_OF_ELABORATION PHASE IN AGENT",UVM_LOW);
 endfunction

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_agent::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    // Print the info message
    `uvm_info("RAM_WR_AGENT","THIS IS START_OF_SIMULATION PHASE IN AGENT",UVM_LOW);
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections
// With in raising ans dropping the objections add  delay of 100 in the run phase before printing
task ram_wr_agent::run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Print the info message
    #100;
        `uvm_info("RAM_WR_AGENT","This is Run Phase",UVM_LOW)
    phase.drop_objection(this);
endtask
function void ram_wr_agent::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    //Print the info message
   `uvm_info("RAM_WR_AGENT","This is Extract Phase",UVM_LOW)
 endfunction

//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_agent::check_phase(uvm_phase phase);
    super.check_phase(phase);
    //Print the info message
    `uvm_info("RAM_WR_AGENT","This is Check Phase",UVM_LOW)
endfunction

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_agent::report_phase(uvm_phase phase);
    super.report_phase(phase);
    //Print the info message
   `uvm_info("RAM_WR_AGENT","This is Report Phase",UVM_LOW)
endfunction
