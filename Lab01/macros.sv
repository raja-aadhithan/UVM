// Extend write_xtn from uvm_sequence_item
class write_xtn extends uvm_sequence_item;
        rand bit[`RAM_WIDTH-1 : 0] data;
        rand bit[`ADDR_SIZE-1 : 0] address;
        rand bit write;
        rand addr_t xtn_type;
        rand bit[63:0] xtn_delay;
        // Factory registration and use macros for all the fields
        `uvm_object_utils_begin(write_xtn)
        `uvm_field_int(data,UVM_ALL_ON)
        `uvm_field_int(address,UVM_ALL_ON)
        `uvm_field_int(write,UVM_ALL_ON)
        `uvm_field_enum(addr_t,xtn_type,UVM_ALL_ON)
        `uvm_field_int(xtn_delay,UVM_ALL_ON)
        `uvm_object_utils_end

        // CONSTRAINTS
        constraint a{ data inside {[20:90]};
                      address inside {[0:200]};
                      xtn_type dist {BAD_XTN:=2 , GOOD_XTN:=30};
                    }
        // METHODS
        extern function new(string name = "write_xtn");
        extern function void post_randomize();
endclass:write_xtn

//-----------------  constructor new method  -------------------//
function write_xtn::new(string name = "write_xtn");
        super.new(name);
endfunction:new

// In post_andomize method assign address to 6000 if xtn_type is BAD_XTN
function void write_xtn::post_randomize();
    if(xtn_type == BAD_XTN)
                begin
                        this.address = 6000;
    end
endfunction : post_randomize