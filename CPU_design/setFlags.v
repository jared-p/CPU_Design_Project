module setFlag(sbit, opcode, inter_flags, shift_flags, flags, en_intermediate, en, condition);
input sbit;
input [3:0] opcode;
input [3:0] inter_flags, shift_flags, condition;
input [15:0] en_intermediate;
output reg [3:0] flags;
output reg [15:0] en;

reg [3:0] temp_flags;

initial
begin
    temp_flags <= 4'b0;
end

always @*
begin
if (sbit || (opcode == 4'b1000))
    begin
        temp_flags[0] = inter_flags[0];
        temp_flags[1] = (inter_flags[1] || shift_flags[1]);
        temp_flags[3:2] = inter_flags[3:2];
    end

case(condition)
	4'b0001: if(  temp_flags[2] == 1'b1) en=en_intermediate; else en=16'b0;
	4'b0010: if( (temp_flags[2] == 1'b0) && (temp_flags[3] == temp_flags[0])) en=en_intermediate; else en=16'b0;
	4'b0011: if( (temp_flags[3] == 1'b1) && (temp_flags[0] == 1'b1)) en=en_intermediate; else en=16'b0;
	4'b0100: if( temp_flags[3] == temp_flags[0] ) en=en_intermediate; else en=16'b0;
	4'b0101: if( (temp_flags[3] == 1'b1) || ((temp_flags[3] == 1'b1) && (temp_flags[0] == 1'b1))) en=en_intermediate; else en=16'b0;
	4'b0110: if( (temp_flags[1] == 1'b1) && (temp_flags[3] == 1'b0)) en=en_intermediate; else en=16'b0;
	4'b0111: if( (temp_flags[1] == 1'b0) && (temp_flags[3] == 1'b1) ) en=en_intermediate; else en=16'b0;
	4'b1000: if( ((temp_flags[1] == 1'b1) && (temp_flags[3] == 1'b0)) || (temp_flags[3] == 1'b1)) en=en_intermediate; else en=16'b0;
	default: en=en_intermediate;
endcase

flags = temp_flags;
end

endmodule