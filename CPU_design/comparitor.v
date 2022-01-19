module compare(in1, in2, cond, out, add_en);

input [31:0]in1, in2;
input [3:0] cond;
input add_en;
output reg [35:0] out;

reg [32:0] temp;

always@ (*)
begin 
if(add_en == 1'b1)
	begin
		out = {36{1'bz}};
		temp = in1-in2;
		
		if(temp[31] == 1'b1)
			out[35] = 1'b1; //zero flag
		else
			out[35] = 1'b0;
		
		if(temp == 0)
			out[34] = 1'b1; //negative flag
		else
			out[34] = 1'b0;
			
		out[33] = ((temp[32] == 1'b1) && (temp[31] == 1'b0)) ? 1'b1 : 1'b0; // cary flag
		
		if(in1[31] == in2[31])
		begin
			out[32] = (in1[31] != in2[31]) ? ((in1[31]!=temp[31])?(1'b1):(1'b0)): (1'b0); //overflow flag
			
	end
else
	begin
		out  = 36'bz;
	end
end 
end
endmodule