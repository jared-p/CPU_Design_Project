//Read and write operations of memory. Memory size is 2^16 words of 32 bits each. 
module RAM (Enable,ReadWrite,Address,DataIn,DataOut);
input Enable,ReadWrite;
input [31:0] DataIn; //using two wires, one for datain and one for data out. each is 32 bits wide
input [15:0] Address; //16 bit address bus 
output reg[31:0] DataOut;

reg [31:0] RAM [0:65535];                  // 2^16 x 32 memory

always @*
	if (Enable)
		if (ReadWrite) //if read = 1 means read from memory
			DataOut = RAM[Address];          //Read
		else
			RAM[Address] = DataIn;           //Write
	else 
		DataOut = 32'bz;            //High impedance state
endmodule