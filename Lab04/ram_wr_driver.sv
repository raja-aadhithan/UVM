// Extend ram_wr_driver from uvm_driver parameterized by write_xtn
class ram_wr_driver extends uvm_driver #(write_xtn);
        `uvm_component_utils(ram_wr_driver)   // Factory Registration
        extern function new(string name ="ram_wr_driver",uvm_component parent);
        extern task run_phase(uvm_phase phase);
        extern task send_to_dut(write_xtn xtn);
endclass
//-----------------  constructor new method  -------------------//
function ram_wr_driver::new(string name = "ram_wr_driver", uvm_component parent);// Define Constructor new() function
        super.new(name,parent);
endfunction
//-----------------  run() phase method  -------------------//
task ram_wr_driver :: run_phase( uvm_phase phase );// In forever loop
        forever begin// Get the sequence item using seq_item_port
                seq_item_port.get_next_item(req);// Call send_to_dut task
                send_to_dut(req);// send the item_done to the sequencer using seq_item_port
                seq_item_port.item_done();
        end
endtask
//-----------------  task send_to_dut() method  -------------------//
task ram_wr_driver :: send_to_dut(write_xtn xtn);// Add task send_to_dut(write_xtn handle as an input argument)
        `uvm_info("DRIVER","Displaying the Data of Driver",UVM_MEDIUM)// Print the transaction
        xtn.print();
endtask