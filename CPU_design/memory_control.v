module memory_control(source1, source2, alu_result, opcode, address, rw, datain, dataout, en, LDR_sel, address_sel);

input [31:0] source1, source2, alu_result, datain;
input [3:0] opcode;

output reg [31:0] dataout;
output reg rw; // if rw = 1 read, if rw = 0 write.
output reg en;
output reg [15:0] address;
output reg LDR_sel, address_sel;

always @ (*)
begin

if( opcode == 4'b1001) // LDR, load register with data from RAM
begin
	// source 1 points to address of the data in the RAM
	
	address = source1[15:0];
	LDR_sel = 1'b1;
	address_sel = 1'b1;
	rw = 1'b1;
	en = 1'b1;

end
else if( opcode == 4'b1010 ) // STR, store register data to RAM
begin
	// source 1 points to the address being written to in RAM
	// source 2 points to the register containing the data to be written in the RAM
	address = source1[15:0];
	dataout = source2;
	LDR_sel = 1'b0;
	address_sel = 1'b1;
	en = 1'b1;
	rw = 1'b0;
	
end
else
begin
	// Case if opcode is not LDR or STR
	en = 1'b1;
	rw = 1'b1;
	LDR_sel = 1'b0;
	address_sel = 1'b0;
end

end


//mux_2x1_16bit address_bus_mux( address_sel, address, str_ldr_address, pc_instruction);

//RAM ram1(en, rw, address, datain , dataout);

//assign LDRdata = datain;

//mux_2x1_32bit ldr_data_mux( LDR_sel, register_data, LDRdata, alu_result);

endmodule