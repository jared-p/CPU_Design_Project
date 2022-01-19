module multiplier(in1, in2, out, mul_en);

input mul_en;
input [31:0] in1, in2;

output [35:0] out;

wire [32:0] temp;

wire isNegative, isZero, hasCarry, hasOverflow;

assign isNegative = (temp[31] === 1'b1) ? 1'b1 : 1'b0;
assign isZero = (temp[31:0] === 32'b0) ? 1'b1 : 1'b0;
assign hasCarry = ((temp[32] === 1'b1) && (temp[31] === 1'b0)) ? 1'b1 : 1'b0;
assign hasOverflow = (!mul_en)?(1'b0):((in1[31] === in2[31]) ? ((in1[31]!==temp[31])?(1'b1):(1'b0)): (1'b0));

assign temp = mul_en ? (in1*in2): 33'bz;

assign out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };

endmodule