module final_design(clk, pc_reset, flags);

input clk;
input pc_reset;
output [3:0] flags;

reg [3:0] condition, opcode, destination, source1, source2;
reg s_bit;
reg [4:0] shift_ror;
reg [15:0] immediate_value;
reg [2:0] shift_control;
wire [31:0] instruction;
reg pc_trigger;
wire [7:0] pc_counter;

initial
begin
pc_trigger <= 1'b0;
opcode <= 4'b1111;
end

always @ (posedge clk or negedge clk)
begin
pc_trigger = !pc_trigger;
shift_control = instruction[2:0];
immediate_value = instruction[18:3];
shift_ror = instruction[10:6];
source2 = instruction[14:11];
source1 = instruction[18:15];
destination = instruction[22:19];
s_bit = instruction[23];
opcode = instruction[27:24];
condition = instruction[31:28];
end

wire [31:0] reg_bank_ldr, out_m1, out_m2, alu_result;

Registry_Bank_Full rgb1(reg_bank_ldr,destination,source1,source2,out_m1,out_m2);


alu_control aluc1(condition, opcode, s_bit, shift_control, immediate_value, out_m1, out_m2, alu_result, flags, pc_trigger, pc_counter, pc_reset);

memory_control_with_RAM mcwr1(out_m1, out_m2, alu_result, opcode, reg_bank_ldr, {8'b0, pc_counter}, instruction);

endmodule