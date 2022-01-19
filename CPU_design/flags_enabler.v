module flags_enabler(condition, flags, en_intermediate, en);

input [3:0] condition, flags;
input [15:0] en_intermediate;

output reg [15:0] en;


//(NZCV)

always @ (*)
begin

case(condition)
	0001: if(flags[2] == 1'b1) en=en_intermediate; else en=16'b0;
	0010: if( (flags[2] == 1'b0) && (flags[3] == flags[0])) en=en_intermediate; else en=16'b0;
	0011: if( (flags[3] == 1'b1) && (flags[0] == 1'b1)) en=en_intermediate; else en=16'b0;
	0100: if( flags[3] == flags[0] ) en=en_intermediate; else en=16'b0;
	0101: if( (flags[3] == 1'b1) || ((flags[3] == 1'b1) && (flags[0] == 1'b1))) en=en_intermediate; else en=16'b0;
	0110: if( (flags[1] == 1'b1) && (flags[3] == 1'b0)) en=en_intermediate; else en=16'b0;
	0111: if( (flags[1] == 1'b0) && (flags[3] == 1'b1) ) en=en_intermediate; else en=16'b0;
	1000: if( ((flags[1] == 1'b1) && (flags[3] == 1'b0)) || (flags[3] == 1'b1)) en=en_intermediate; else en=16'b0;
	default: en=en_intermediate;
endcase
end
endmodule