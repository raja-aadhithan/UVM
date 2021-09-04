module top;
        import uvm_pkg::*;
        import ram_pkg::*;      //import ram_pkg
        write_xtn wr_copy_xtnh, wr_clone_xtnh;// Declare two handles of write_xtn class wr_copy_xtnh and wr_clone_xtnh
        write_xtn wr_xtnh[];// Declare dynamic array of handles for write_xtn as wr_xtnh
        int no_trans = 10;// Declare a variable no_trans as int data type and initialize it with value 10.
        initial begin// Within initial block
                wr_xtnh = new[no_trans];// Allocate the size of above declared array equal to 10
                for (int i = 0 ; i <10 ; i++ ) begin // Within for loop, Generate ten random transactions
                        wr_xtnh[i] = write_xtn::type_id::create($sformatf("wr_xtnh[%0d]",i));// Create 10 tr class objects with different strings using $sformatf
                        assert(wr_xtnh[i].randomize());// randomize & print the 10 transaction class objects
                        wr_xtnh[i].print(uvm_default_table_printer);
                end
                wr_xtnh[3].copy(wr_xtnh[5]);// Copy the 5th transaction item into the 3rd transaction item using copy method
                wr_copy_xtnh = write_xtn::type_id::create("wr_copy_xtnh");// Copy the 3rd transaction item into another item(wr_copy_xtnh) using copy method
                wr_copy_xtnh.copy(wr_xtnh[3]);// Note : Do create an instance for wr_copy_xtnh
                wr_copy_xtnh.print(uvm_default_tree_printer);//Print the object wr_copy_xtnh in a tree format
                if(wr_xtnh[3].compare(wr_xtnh[5])) $display("compare successful");// Call Compare method on the 5th and 3rd transaction items
                else $display("compare failed");
                $cast(wr_clone_xtnh, wr_xtnh[8].clone());// Using clone() method copy the 8th item to another item(wr_clone_xtnh)
                // Note : Do not create an instance for wr_clone_xtnh
                wr_clone_xtnh.print(uvm_default_line_printer);//Print the object wr_clone_xtnh in a line format
        end
endmodule : top
