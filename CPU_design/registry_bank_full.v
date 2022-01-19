module Registry_Bank_Full(ldr,d_bits,s1_bits,s2_bits,out_m1,out_m2);
parameter n = 32;
input [n-1:0] ldr;
input [3:0] d_bits,s1_bits,s2_bits;
output [n-1:0] out_m1,out_m2;
wire [n-1:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16;
wire [15:0] wire1;



wire [31:0] ldr_wire;


n_decoder d1(d_bits,wire1, ldr, ldr_wire); // Decodes Destination bits to allocate a register in the bank
reg_bank r1(ldr,wire1,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16); // Fills decoded register with ldr
n_mux m1(out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,s1_bits,out_m1); // using source-1 bits outputs source 1 from mux1
n_mux m2(out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,s2_bits,out_m2); // using source-2 bits outputs source 2 from mux2

endmodule