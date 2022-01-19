module bit_or(in1, in2, out, bit_or_en);

input bit_or_en;
input [31:0] in1, in2;

output [35:0] out;

wire [32:0] temp;

wire isNegative, isZero, hasCarry, hasOverflow;

assign isNegative = (temp[31] == 1'b1) ? 1'b1 : 1'b0;
assign isZero = (temp[31:0] == 32'b0) ? 1'b1 : 1'b0;
assign hasCarry = 1'b0;
assign hasOverflow = 1'b0;

assign temp = bit_or_en? (in1|in2):32'bz;

assign out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };

endmodule