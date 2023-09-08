module RegFile(input [4:0] writeReg, readReg1, readReg2,
               input wire clk, write,
               input wire [31:0] writeData,
               output wire [31:0] readData1, readData2);

	reg [31:0] reg_mem [31:0];
	
	assign readData1 = readReg1==0?0:reg_mem[readReg1];
	assign readData2 = readReg2==0?0:reg_mem[readReg2];
	
	always @(posedge clk) begin
		if (write == 1) begin
			reg_mem[writeReg] = writeData;
			end
	end	
endmodule
	