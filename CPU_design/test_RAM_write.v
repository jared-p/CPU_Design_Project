module test_memory;
    reg  enable,ReadWrite;
    reg [31:0] D_In;
    reg [15:0] Address;
    wire [31:0] D_Out;

RAM test_ram(enable,ReadWrite,Address,D_In,D_Out); 

initial  
begin
   enable =0;   ReadWrite=0;	Address=16'd0;	D_In =16'hAAAA;
#5 enable =1;   ReadWrite=0;	Address=16'd0;	D_In =16'hAAAA;
#5 enable =1;   ReadWrite=0;	Address=16'd1;	D_In =16'h00AA;
#5 enable =1;   ReadWrite=0;	Address=16'd2;	D_In =16'h00BB;
#5 enable =1;   ReadWrite=0;	Address=16'd3;	D_In =16'h00CC;
#5 enable =1;   ReadWrite=0;	Address=16'd4;	D_In =16'h00DD;
#5 enable =1;   ReadWrite=0;	Address=16'd5;	D_In =16'h00EE;
#5 enable =1;   ReadWrite=0;	Address=16'd6;	D_In =16'h00FF;
#5 enable =1;   ReadWrite=0;	Address=16'd7;	D_In =16'hFFFF;
#10

  $writememh("data_h.txt", test_ram.RAM);
end
endmodule
