module immediateMov(n, r1, add_en);
input  [15:0] n;
input add_en;
output reg [35:0] r1;

always @*
begin 
if(add_en==1'b1)
begin
	r1={16'b0,n};
	r1[35:32] = 4'b0;
end
else
r1=35'bz;
end

endmodule