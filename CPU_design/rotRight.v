module rotRight(din,out,s_value,enbit);

parameter N = 5;

input [31:0] din;
input [4:0] s_value;
input enbit;
output reg [35:0] out;

reg isNegative, isZero, hasCarry, hasOverflow;

reg [31:0] temp;

always @*
begin
if(enbit==1'b1)
begin

    if( s_value == 0)
        temp = din;
    else if(s_value == 1)
        temp = {din[0], din[31:1]};
    else if(s_value == 2)
        temp = {din[1:0], din[31:2]};
    else if(s_value == 3)
        temp = {din[2:0], din[31:3]};
    else if(s_value == 4)
        temp = {din[3:0], din[31:4]};
    else if(s_value == 5)
        temp = {din[4:0], din[31:5]};
    else
        temp = {din[N-1:0], din[31:N]};
 
 isNegative = (temp[31] == 1'b1) ? 1'b1 : 1'b0;
 isZero = (temp[31:0] == 32'b0) ? 1'b1 : 1'b0;
 hasCarry = 1'b0;
 hasOverflow = 1'b0;
 
 
 out = {isNegative, isZero, hasCarry, hasOverflow, temp[31:0] };
end
else
begin
out = 35'bz;
end
end
endmodule