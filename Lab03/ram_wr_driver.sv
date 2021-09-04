// Extend ram_wr_driver from uvm_driver
class ram_wr_driver extends uvm_driver;
   `uvm_component_utils(ram_wr_driver)// Factory Registration
        // Add all the UVM phases:
        extern function new(string name = "ram_wr_driver",uvm_component parent);
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
function ram_wr_driver::new(string name = "ram_wr_driver",uvm_component parent);//Add code for new()
        super.new(name,parent);
endfunction
// Add body for all UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc
// Hint : `uvm_info(“RAM_DRIVER”,”This is Build Phase ”, UVM_LOW)

//-----------------  Add UVM build() phase   -------------------//
function void ram_wr_driver::build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS BUILD PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_driver::connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS CONNECT PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_driver:: end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS END_OF_ELABORATION PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_driver:: start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS START_OF_SIMULATION PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections
// With in raising and dropping the objections add delay of 10 in the run phase before printing
task ram_wr_driver::run_phase(uvm_phase phase);
        super.run();
        phase.raise_objection(this);
        #10;
        `uvm_info("RAM_DRIVER","THIS IS RUN PHASE IN DRIVER",UVM_LOW);
        phase.drop_objection(this);
endtask


function void ram_wr_driver:: extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS EXTRACT PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM check() phase   -------------------//

function void ram_wr_driver::check_phase(uvm_phase phase);
        super.check_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS CHECK PHASE IN DRIVER",UVM_LOW);
endfunction

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_driver::report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("RAM_DRIVER","THIS IS REPORT PHASE IN DRIVER",UVM_LOW);
endfunction