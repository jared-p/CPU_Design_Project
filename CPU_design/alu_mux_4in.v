module alu_mux_4_in(sel, out, in0, in1, in2, in3);

input [1:0] sel;
input [35:0]  in1, in2, in3;
input [31:0] in0;

output reg [35:0] out;

always @ (*)
begin

case( sel)

2'b00: out = {4'b0,in0};
2'b01: out = in1;
2'b10: out = in2;
2'b11: out = in3;

endcase
end
endmodule