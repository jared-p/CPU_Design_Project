module alu_decoder_4out(op_code,out);

input [1:0] op_code; //input is the d_bits (when instantiated from Registry_Bank_Full)
output reg [3:0] out; //this is the register that the decoder selects





always @(*)
begin
case (op_code)
2'b00: out = 4'b0001;
2'b01: out = 4'b0010;
2'b10: out = 4'b0100;
2'b11: out = 4'b1000;
endcase


end
endmodule