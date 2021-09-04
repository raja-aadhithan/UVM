// Extend ram_env from uvm_env
class ram_env extends uvm_env;
        `uvm_component_utils(ram_env)  // Factory Registration
        ram_wr_agent wr_agnth;// Declare the ram_wr_agent handle

        // Standard UVM Methods:
        extern function new(string name = "ram_env",uvm_component parent);
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
function ram_env::new(string name="ram_env",uvm_component parent);
        super.new(name,parent);
endfunction

// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc
//        Print using `uvm_info("RAM_ENV","This is build phase",UVM_LOW)  in all the phase

 //-----------------  Add UVM build() phase   -------------------//
//Create the instance of ram_wr_agent in build phase
function void ram_env::build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Create the instance of agent in the build phase
        wr_agnth=ram_wr_agent::type_id::create("wr_agnth",this);
        `uvm_info("RAM_ENV","THIS IS BUILD PHASE OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM connect() phase   -------------------//
function void ram_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("RAM_ENV","THIS IS CONNECT PHASE OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_env::end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info("RAM_ENV","THIS IS AN END OF ELABORATION OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_env::start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info("RAM_ENV","THIS IS START OF SIMULATION OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections
// With in raising ans dropping the objections add 100 delay in the run phase before printing
task ram_env::run_phase(uvm_phase phase);
        super.run();
    phase.raise_objection(this);
        #10;
        `uvm_info("RAM_ENV ","THIS IS RUN PHASE OF ram_env",UVM_LOW)
    phase.drop_objection(this);
endtask

//-----------------  Add UVM extract() phase   -------------------//
function void ram_env::extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        `uvm_info("RAM_ENV","THIS IS EXTRACT PHASE OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM check() phase   -------------------//
function void ram_env::check_phase(uvm_phase phase);
        super.check_phase(phase);
        `uvm_info("RAM_ENV","THIS IS CHECK PHASE OF ram_env",UVM_LOW)
endfunction

//-----------------  Add UVM report() phase   -------------------//
function void ram_env::report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("RAM_ENV","THIS IS REPORT PHASE OF ram_env",UVM_LOW)
endfunction