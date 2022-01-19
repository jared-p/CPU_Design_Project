module mov(r1,r2, add_en);
input [31:0] r2;
input add_en;
output reg [35:0] r1;
always @*
begin 
if (add_en ==1'b1)
begin
    r1[31:0]=r2;
    r1[35:32] = 4'b0000;
end
else 
    r1 = 35'bz;

end
endmodule
