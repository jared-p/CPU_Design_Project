module mux_2x1_32bit(LDR_sel, register_data, ram_in, alu_result);

input [31:0] ram_in, alu_result;
input  LDR_sel;
output reg [31:0] register_data;

always @(*)
begin
case (LDR_sel)
1'b1: register_data = ram_in;
1'b0: register_data = alu_result;
endcase

end
endmodule