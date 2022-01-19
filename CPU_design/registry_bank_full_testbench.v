module Test_Registry_Bank;
reg [3:0] d,s1,s2;
reg [31:0] ldr;
wire [31:0] out1,out2;

initial
begin
		d = 5; s1 = 0; s2 = 5; ldr = 32'hAAAAAAAA;
#10     d = 0; s1 = 0; s2 = 5; ldr = 32'hBBBBBBBB;
#10    	d = 3; s1 = 3; s2 = 4; ldr = 32'hCCCCCCCC;
#10     d = 4; s1 = 3; s2 = 4; ldr = 32'hDDDDDDDD;
end
initial
begin
$monitor($time, " d=%d, s1=%d, s2=%d, ldr=%h, out1=%h, out2=%h,\n, out0=%h, out1=%h, out2=%h, out3=%h, out4=%h, out5=%h, out6=%h, out7=%h, out8=%h, out9=%h, out10=%h, out11=%h, out12=%h, out13=%h, out14=%h, out15=%h", d,s1,s2,ldr, out1, out2,Test1.out1,Test1.out2,Test1.out3,Test1.out4,Test1.out5,Test1.out6,Test1.out7,Test1.out8,Test1.out9,Test1.out10,Test1.out11,Test1.out12,Test1.out13,Test1.out14,Test1.out15, Test1.out16);
end

Registry_Bank_Full Test1(ldr,d,s1,s2,out1,out2);
endmodule