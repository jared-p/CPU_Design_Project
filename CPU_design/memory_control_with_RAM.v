module memory_control_with_RAM(source1, source2, alu_result, opcode, register_data, pc_instruction, instruction);

input [31:0] source1, source2, alu_result;
input [3:0] opcode;
input [15:0] pc_instruction;

wire [31:0] dataout, datain;
wire rw; // if rw = 1 read, if rw = 0 write.
wire en;
wire [15:0] address, str_ldr_address;
wire LDR_sel, address_sel;

output [31:0] register_data;
output [31:0] instruction;

memory_control mem_c1(source1, source2, alu_result, opcode, str_ldr_address, rw, datain, dataout, en, LDR_sel, address_sel);

mux_2x1_16bit address_bus_mux( address_sel, address, str_ldr_address, pc_instruction);

// manual parititioning of the data to read instructions versus read/write that data

RAM ram1(en, rw, address, dataout, datain); //dataout/datain is with respect to memory_control, i.e dataout of memory_control is datain to RAM

// instruction only RAM, use this to fetch the next instruction
RAM ram2(en, 1'b1, pc_instruction, dataout, instruction);


// mux_2x1_32bit ldr_data_mux( LDR_sel, register_data, datain, alu_result);

assign register_data = (LDR_sel) ? (datain) : (alu_result);

endmodule