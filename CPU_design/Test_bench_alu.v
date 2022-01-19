module Test_ALU;
reg s;
reg [2:0] shift;
reg [15:0] immediate_value;
reg [31:0] source1,source2;
reg [3:0] cond,opcode;
wire [31:0] result;
wire [3:0] flags;

reg pc_trigger, pc_reset;
wire [7:0] pc_out;




initial
begin
	s = 0; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0000_00001; source2 = 32'h0000_0002; cond = 4'b0000; opcode = 4'b0000; pc_trigger=1'b1; pc_reset=1'b0; // ADD expecting result = 32'h0000_0003 & no flags set adder WORKING
//10
#10 	s = 0; shift = 3'b0; immediate_value = 16'b0010_0100_0001_1xxx; source1 = 32'h5555_5555; source2 = 32'h3333_3333; cond = 4'b0000; opcode = 4'b0001;	pc_trigger=1'b0; pc_reset=1'b1;// SUB expecting result = 32'h2222_2222 & no flags set subtraction WORKING
//20
#10 	s = 1; shift = 3'b001; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'b0000_1001; source2 = 32'b0000_0110; cond = 4'b0000; opcode = 4'b0011; pc_trigger=1'b1; pc_reset=1'b1;	// bitwise OR on shifted input (source2 goes to 32'b0 after shift) expecting result = 32'b1001 & no flags set
//30
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0000_1111; source2 = 32'h0000_1111; cond = 4'b0000; opcode = 4'b0001;	pc_trigger=1'b0; pc_reset=1'b1;// SUB expecting result = 32'h0 & z flag set to 1
//40
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0000_0000; source2 = 32'h0000_ffff; cond = 4'b0000; opcode = 4'b0001; pc_trigger=1'b1; pc_reset=1'b1;// SUB expecting result = 32'hFFFF_0001 & n flag set to 1
//50
#10     s = 1; shift=3'b0; immediate_value = 16'b0001_0011_0000_1xxx; source1 = 32'b101; source2 = 32'b101; cond = 4'b0000; opcode = 4'b0010; pc_trigger=1'b0; pc_reset=1'b1; // multiplier, result = 32'h0000_00AF, all flags set to zero
//60
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0001_1111; source2 = 32'h0000_1111; cond = 4'b0000; opcode = 4'b0100;	pc_trigger=1'b1; pc_reset=1'b1;// bitwise AND, should ouput 32'h0000_1111
//70
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0001_1110; source2 = 32'h0000_1111; cond = 4'b0000; opcode = 4'b0101;	 pc_trigger=1'b0; pc_reset=1'b1;// bitwise XOR, should output 32'h0001_0001
//80
#10 	s = 1; shift = 3'b0; immediate_value = 16'b1111_1111_1111_1111; source1 = 32'h0001_1110; source2 = 32'h0000_1111; cond = 4'b0000; opcode = 4'b0110;	 pc_trigger=1'b1; pc_reset=1'b0;// immediate move, out=immediate_value=1111_1111_1111_1111
//90
#10 	s = 1; shift = 3'b0; immediate_value = 16'b1111_1111_1111_1111; source1 = 32'h0001_1110; source2 = 32'h0000_1111; cond = 4'b0000; opcode = 4'b0111;	 pc_trigger=1'b0; pc_reset=1'b1;// move, out=source2=32h'0000_1111
//100
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0000_1111; source2 = 32'h0000_1111; cond = 4'b0001; opcode = 4'b1000;	 pc_trigger=1'b1; pc_reset=1'b1;// comapare equal than, out=1
//110
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'hF001_1111; source2 = 32'h0000_1111; cond = 4'b0010; opcode = 4'b1000;	 pc_trigger=1'b0; pc_reset=1'b1;// compare greater than, out = 0
//120
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0001_1111; source2 = 32'h0000_1111; cond = 4'b0110; opcode = 4'b1000;	 pc_trigger=1'b1; pc_reset=1'b1;// compare unisgned higher than, out = 1
//130
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0001_1111; source2 = 32'h0000_1111; cond = 4'b0110; opcode = 4'b1001;	 pc_trigger=1'b0; pc_reset=1'b1;// LDR, doesnt matter the output since the register bank will never take it
//140
#10 	s = 1; shift = 3'b0; immediate_value = 16'b0001_0011_0001_1xxx; source1 = 32'h0001_1111; source2 = 32'h0000_1111; cond = 4'b0110; opcode = 4'b1111;	 pc_trigger=1'b1; pc_reset=1'b1;// No Instruction, outputs high imedance


end
initial
begin
$monitor($time, " \nsource1 = %b \nsource2 = %b\nsrce2_int=%b \nresult =  %b, flags (nzcv) = %b, program counter=%d", source1, source2, Test_ALU_call.intermediate_source2, result, flags, pc_out);
end

alu_control Test_ALU_call(cond, opcode, s, shift, immediate_value, source1, source2, result, flags, pc_trigger, pc_out, pc_reset);
endmodule


