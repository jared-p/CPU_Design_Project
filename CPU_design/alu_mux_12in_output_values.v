module alu_mux_12_in_output_value(opcode, out, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11);

input [3:0] opcode;
input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11;

output reg [31:0] out;

always @ (*)
begin

case( opcode)

4'b0000: out = in0;
4'b0001: out = in1;
4'b0010: out = in2;
4'b0011: out = in3;
4'b0100: out = in4;
4'b0101: out = in5;
4'b0110: out = in6;
4'b0111: out = in7;
4'b1000: out = in8;
4'b1001: out = in9;
4'b1010: out = in10;
4'b1111: out = in11;

endcase
end
endmodule