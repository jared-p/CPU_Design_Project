module alu_control(condition, opcode, s, shift, immediate_value, source1, source2, result, flags, pc_trigger, pc_out, pc_reset);

input [3:0] condition, opcode;
input [31:0] source1, source2;
input [15:0] immediate_value;
input [2:0] shift;
input s;

output [31:0] result;
output [3:0] flags;

wire [35:0] right_rotate_result, right_shift_result, add_result, sub_result, mult_result, or_result, and_result, xor_result, left_shift_result,  multiplexer_result, mov_result, immediate_mov_result, comparitor_result, str_result;

wire s_en;
wire [15:0] en_intermediate, en;
wire [3:0] en_sr;
wire [3:0] intermediate_flags;
wire [35:0] intermediate_source2;

//pc related
input pc_trigger, pc_reset;
output [7:0] pc_out;


alu_decoder_4out decoder1(shift[1:0], en_sr);

right_shift_reg #(5) rs1(source2, right_shift_result,immediate_value[7:3],  en_sr[1]); //#(immediate_value[7:3])
leftShift_reg #(5) ls1(source2, left_shift_result,immediate_value[7:3], en_sr[2]);
rotRight #(5) rr1(source2, right_rotate_result, immediate_value[7:3], en_sr[3]);

alu_mux_4_in sm1(shift[1:0], intermediate_source2, source2, right_shift_result, left_shift_result, right_rotate_result);

alu_decoder_16out d1(opcode, en_intermediate);

adder a1(source1, intermediate_source2[31:0], add_result, en[0]);
subtractor s1(source1, intermediate_source2[31:0], sub_result, en[1]);
multiplier m1(source1, intermediate_source2[31:0], mult_result, en[2]);
bit_or o1(source1, intermediate_source2[31:0], or_result, en[3]);
bit_and and1(source1, intermediate_source2[31:0], and_result, en[4]);
bit_xor x1(source1, intermediate_source2[31:0], xor_result, en[5]);
immediateMov im_move1(immediate_value, immediate_mov_result, en[6]);
mov move1(mov_result, intermediate_source2[31:0], en[7]);
compare comp1(source1, intermediate_source2[31:0], condition, comparitor_result ,en[8]);
mov str(str_result, intermediate_source2[31:0], en[10]);


alu_mux_12_in_output_value outmux1(opcode, result, add_result[31:0], sub_result[31:0], mult_result[31:0], or_result[31:0], and_result[31:0], xor_result[31:0], immediate_mov_result[31:0], mov_result[31:0], comparitor_result[31:0], str_result[31:0], {32{1'bx}},{32{1'bz}});

alu_mux_12_in_flag_value flagmux1(opcode, intermediate_flags, add_result[35:32], sub_result[35:32], mult_result[35:32], or_result[35:32], and_result[35:32], xor_result[35:32], immediate_mov_result[35:32], mov_result[35:32], comparitor_result[35:32], 4'b0000, 4'b0000, 4'b0000);

setFlag sf1(s, opcode, intermediate_flags, intermediate_source2[35:32], flags, en_intermediate, en, condition);

programCounter pc1(pc_trigger ,pc_reset, pc_out);

endmodule
 