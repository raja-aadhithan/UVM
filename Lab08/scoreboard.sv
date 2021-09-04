class ram_scoreboard extends uvm_scoreboard; // Extend ram_scoreboard from uvm_scoreboard
        uvm_tlm_analysis_fifo #(read_xtn) fifo_rdh;// Declare handles for uvm_tlm_analysis_fifos parameterized by read & write
        uvm_tlm_analysis_fifo #(write_xtn) fifo_wrh;//transactions as fifo_rdh & fifo_wrh respectively
        int wr_xtns_in,rd_xtns_in,xtns_compared,xtns_dropped;// Add the following integers for Scoreboard Statistics
        `uvm_component_utils(ram_scoreboard)// Factory registration
        logic [63:0] ref_data [bit[31:0]]; // Declare an Associative array as a reference model Type logic [63:0] and index type int
        write_xtn wr_data;// Declare handles of type write_xtn & read_xtn as wr_data & rd_data to store the tlm_analysis_fifo data
        read_xtn rd_data;
        extern function new(string name,uvm_component parent);// Standard UVM Methods:
        extern function void mem_write(write_xtn wd);
        extern function bit mem_read(ref read_xtn rd);
        extern task run_phase(uvm_phase phase);
        extern function void check_data(read_xtn rd);
        extern function void report_phase(uvm_phase phase);
endclass
function ram_scoreboard::new(string name,uvm_component parent);// constructor new method
        super.new(name,parent);// Add Constructor function
        fifo_rdh = new("fifo_rdh",this);// Create instances of uvm_tlm_analysis fifos inside the constructor
        fifo_wrh = new("fifo_wrh",this);// using new("fifo_h", this)
endfunction
function void ram_scoreboard::mem_write(write_xtn wd); // mem_write() method
        if(wd.write)  begin
                ref_data[wd.address] = wd.data; //Explore mem_write method
                `uvm_info(get_type_name(), $sformatf("Write Transaction from Write agt_top \n %s",wd.sprint()), UVM_HIGH)
                wr_xtns_in ++; //method to write write_xtn into ref model
        end
endfunction : mem_write
function bit ram_scoreboard::mem_read(ref read_xtn rd); //  mem_read() method
        if(rd.read)begin //Explore mem_read method
                `uvm_info(get_type_name(), $sformatf("Read Transaction from Read agt_top \n %s",rd.sprint()), UVM_HIGH)
                `uvm_info("MEM Function", $psprintf("Address = %h", rd.address), UVM_LOW)
                if(ref_data.exists(rd.address)) begin //method to read read_xtn from ref model
                        rd.data = ref_data[rd.address] ;
                        rd_xtns_in ++;
                        return(1);
                end
                else begin
                        xtns_dropped ++;
                        return(0);
                end
        end
endfunction : mem_read
task ram_scoreboard::run_phase(uvm_phase phase); //  run() phase
        fork // In forever loop
                forever begin// get and print the write data using the tlm fifo
                        fifo_wrh.get(wr_data);// Call the method mem_write
                        mem_write(wr_data);
                        `uvm_info("WRITE SB","write data",UVM_LOW);
                        wr_data.print;
                end
                forever begin// In forever loop
                        fifo_rdh.get(rd_data); // get and print the read data using the tlm fifo
                        `uvm_info("READ SB","read data",UVM_LOW);// Call the method check_data
                        rd_data.print;
                        check_data(rd_data);
                end
        join
endtask
function void ram_scoreboard::check_data(read_xtn rd); //Explore method check_data
        read_xtn ref_xtn;
        $cast( ref_xtn, rd.clone()); // Copy of read XTN
        // Update transaction handle to compared by calling read method of ref_data mem_read(ref_xtn);
        `uvm_info(get_type_name(), $sformatf("Read Transaction from Memory_Model \n %s",ref_xtn.sprint()), UVM_HIGH)
        if(mem_read(ref_xtn)) begin //compare
                if(rd.compare(ref_xtn)) begin
                        `uvm_info(get_type_name(), $sformatf("Scoreboard - Data Match successful"), UVM_MEDIUM)
                        xtns_compared++ ;
                end
                else
                        `uvm_error(get_type_name(),$sformatf("\n SB Error[Data Mismatch]:\n Rcvd Transaction:\n %s \n Expected Transaction: \n %s",
                                  rd.sprint(), ref_xtn.sprint()))
                end
        else
                uvm_report_info(get_type_name(), $psprintf("No Data written in the address=%d \n %s",rd.address, rd.sprint()));
endfunction
function void ram_scoreboard::report_phase(uvm_phase phase); // Displays the final report of test using scoreboard statistic
   `uvm_info(get_type_name(), $sformatf("MSTB: Simulation Report from ScoreBoard \n Number of Read Transactions from Read agt_top : %0d \n Number of Write Transactions from write agt_top : %0d \n Number of Read Transactions Dropped : %0d \n Number of Read Transactions compared : %0d \n\n",rd_xtns_in, wr_xtns_in, xtns_dropped, xtns_compared), UVM_LOW)
endfunction
