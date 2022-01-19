module adder(in1, in2, out, add_en);


input add_en;
input [31:0] in1, in2;
output [35:0] out;
wire [32:0] temp;
wire isNegative, isZero, hasCarry, hasOverflow;

assign temp = add_en ? (in1[31:0] + in2[31:0]) : 33'bz;

//Setting appropriate flags 
assign isNegative = (temp[31] === 1'b1) ? 1'b1 : 1'b0;
assign isZero = (temp[31:0] === 32'b0) ? 1'b1 : 1'b0;
assign hasCarry = ((temp[32] === 1'b1) && (temp[31] === 1'b0)) ? 1'b1 : 1'b0;
assign hasOverflow = (!add_en)?(1'b0):((in1[31] === in2[31]) ? ((in1[31]!==temp[31])?(1'b1):(1'b0)): (1'b0));

assign out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0]};

endmodule