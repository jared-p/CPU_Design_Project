//this is a test bench to test the read functionality of the RAM 
module test_memory_read; 
    reg  enable,ReadWrite;
    reg [31:0] D_In;
    reg [15:0] Address;
    wire [31:0] D_Out;

RAM test_ram(enable,ReadWrite,Address,D_In,D_Out); 

initial  
begin

 $readmemh("RAM Write.txt", test_ram.RAM);

   enable =0;   ReadWrite=1;	Address=16'd0;	
#5 enable =1;   ReadWrite=1;	Address=16'd0;	
#5 enable =1;   ReadWrite=1;	Address=16'd1;	
#5 enable =1;   ReadWrite=1;	Address=16'd2;	
#5 enable =1;   ReadWrite=1;	Address=16'd3;	
#5 enable =1;   ReadWrite=1;	Address=16'd4;	
#5 enable =1;   ReadWrite=1;	Address=16'd5;	
#5 enable =1;   ReadWrite=1;	Address=16'd6;	
#5 enable =1;   ReadWrite=1;	Address=16'd7;	

end

initial
begin
$monitor($time, "data at address %d is %h", Address, D_Out);
end

endmodule
