module bit_and(in1, in2, out, bit_and_en);

input [31:0] in1, in2;

input bit_and_en;

output [35:0] out;

wire [32:0] temp;

wire isNegative, isZero, hasCarry, hasOverflow;

assign isNegative = (temp[31] == 1'b1) ? 1'b1 : 1'b0;
assign isZero = (temp[31:0] == 32'b0) ? 1'b1 : 1'b0;
assign hasCarry = 1'b0;
assign hasOverflow = 1'b0;

assign temp = bit_and_en ? (in1[31:0] & in2[31:0]) : 32'bz;

assign out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };

endmodule