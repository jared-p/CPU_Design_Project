module programCounter( cycle, rst, out);
input cycle;
input rst;
output reg [7:0] out;


always@(cycle)
begin
if (!rst)
	out = 8'b0;

else
	out = out+8'b1;

end

endmodule
