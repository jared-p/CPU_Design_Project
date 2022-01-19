module right_shift_reg(din,out,s_value,right_shift_en);

parameter N = 5;

input [4:0] s_value;
input [31:0] din;
input right_shift_en;
output reg [35:0] out;

reg [32:0] temp;

reg isNegative, isZero, hasCarry, hasOverflow;

always @*
begin
	if (right_shift_en==1'b1)
	begin
	if( s_value > N)
		temp = din>>N;
	else
		temp = din >> s_value;
		
	temp[32]= din[s_value-1] ; //temp[32] is the carry 
	isNegative = (temp[31] == 1'b1) ? 1'b1 : 1'b0;
	isZero = (temp[31:0] == 32'b0) ? 1'b1 : 1'b0;
	hasCarry = (temp[32] == 1'b1 ) ? 1'b1 : 1'b0;
	hasOverflow = 1'b0;

 
	out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };
end

else
begin
	out = 35'bz;
end
end
endmodule