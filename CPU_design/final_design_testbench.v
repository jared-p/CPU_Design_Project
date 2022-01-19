module final_design_test;

reg clk;
reg pc_reset;
wire [3:0] flags;

initial
begin

$readmemb("demo_v2_c1.txt", fd.mcwr1.ram1.RAM); // data goes here
$readmemb("demo_v2_c1.txt", fd.mcwr1.ram2.RAM); //instruction set here

clk = 0; pc_reset = 0;
#5 pc_reset = 1;


#40 $writememb("ram_output.txt", fd.mcwr1.ram1.RAM); $finish;


end


always #5 clk = ~clk;


initial
begin
$monitor("r0 =%d,r1 =%d,r2 =%d,r3 =%d\nr4 =%d,r5 =%d,r6 =%d,r7 =%d\nr8 =%d,r9 =%d,r10=%d,r11=%d\nr12=%d,r13=%d,r14=%d,r15=%d\nFLAGS (NZCV)=%b\npc_counter=%d\n\n\ninstruction=%b", fd.rgb1.out1, fd.rgb1.out2, fd.rgb1.out3, fd.rgb1.out4, fd.rgb1.out5, fd.rgb1.out6, fd.rgb1.out7, fd.rgb1.out8, fd.rgb1.out9, fd.rgb1.out10, fd.rgb1.out11, fd.rgb1.out12, fd.rgb1.out13, fd.rgb1.out14, fd.rgb1.out15, fd.rgb1.out16,flags,  fd.pc_counter, fd.instruction);
// fd.mcwr1.ram1.RAM[0]
end

final_design fd(clk, pc_reset, flags);

endmodule