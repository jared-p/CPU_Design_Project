module mux_2x1_16bit(sel, out, in1, in0);

input [15:0] in1, in0;
input  sel;
output reg [15:0] out;
always @(*)
begin
case (sel)
1'b1: out = in1;
1'b0: out = in0;

endcase
end
endmodule