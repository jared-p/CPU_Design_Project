module leftShift_reg(din,out,s_value,enbit);

parameter N = 5;

input [31:0] din;
input [4:0] s_value;
input enbit;
output reg [35:0] out;

reg [32:0] temp;

reg isNegative, isZero, hasCarry, hasOverflow;

always@*
begin
if(enbit==1'b1)
begin

	if( s_value > N)
		temp = din<<N;
	else
		temp = din<<s_value;
		
isNegative = (temp[31] == 1'b1) ? 1'b1 : 1'b0;
isZero = (temp[31:0] == 32'b0) ? 1'b1 : 1'b0;
hasCarry = (temp[32] == 1'b1 ) ? 1'b1 : 1'b0;
hasOverflow = 1'b0;
out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };
end
else 
begin
out = {4'b0,32'bz};
end
end
endmodule