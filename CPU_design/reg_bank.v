module reg_bank(ldr,in,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16);

parameter n = 32;
input [n-1:0] ldr;
input [15:0] in;

output reg [n-1:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16;



always @(*)
begin

if( ldr[0] !== 1'bz )
begin
case (in)
16'b0000_0000_0000_0001: out1 = ldr;
16'b0000_0000_0000_0010: out2 = ldr;
16'b0000_0000_0000_0100: out3 = ldr;
16'b0000_0000_0000_1000: out4 = ldr;
16'b0000_0000_0001_0000: out5 = ldr;
16'b0000_0000_0010_0000: out6 = ldr;
16'b0000_0000_0100_0000: out7 = ldr;
16'b0000_0000_1000_0000: out8 = ldr;
16'b0000_0001_0000_0000: out9 = ldr;
16'b0000_0010_0000_0000: out10 = ldr;
16'b0000_0100_0000_0000: out11 = ldr;
16'b0000_1000_0000_0000: out12 = ldr;
16'b0001_0000_0000_0000: out13 = ldr;
16'b0010_0000_0000_0000: out14 = ldr;
16'b0100_0000_0000_0000: out15 = ldr;
16'b1000_0000_0000_0000: out16 = ldr;
endcase
end


end
endmodule