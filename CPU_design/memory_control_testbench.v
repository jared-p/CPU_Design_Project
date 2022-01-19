module memory_control_with_RAM_testbench;

reg [31:0] source1, source2, alu_result;
reg [3:0] opcode;
reg [15:0] pc_instruction;

wire [31:0] register_data;

initial
begin

$readmemh("data_h.txt", ctrl.ram1.RAM);

source1 = 32'b0; source2 = 32'b0; alu_result = 32'b0; opcode = 4'b1001; pc_instruction = 16'hFFFF;

#10 source1 = 32'b1; source2 = 32'hABCDABCD; alu_result = 32'hEFEFEFEF; opcode = 4'b1010; pc_instruction = 16'hFFFF;
#10 source1 = 32'b1; source2 = 32'b0; alu_result = 32'b0; opcode = 4'b1001; pc_instruction = 16'hFFFF;
#10 source1 = 32'b1; source2 = 32'b1; alu_result = 32'hAF; opcode = 4'b1101; pc_instruction = 16'hFFFF;

end

initial
begin
$monitor($time, " source1=%h, source2=%h, alu_result=%h, opcode=%b, output to register=%h", source1, source2, alu_result, opcode, register_data);
end


memory_control_with_RAM ctrl(source1, source2, alu_result, opcode, register_data, pc_instruction);


endmodule