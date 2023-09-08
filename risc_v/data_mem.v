module data_memory(input wire [31:0] address, writeData,
                    input wire write,clk,        ///add enable signal later
                   output wire [31:0] readData );
reg [31:0] data_mem [0: 255];
always@(posedge clk)begin
    if(write)  data_mem[address[31:2]] = writeData ;
end
assign readData = data_mem[address[31:2]];

endmodule

