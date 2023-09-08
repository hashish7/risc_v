module tb;
logic [31:0] instruction,pc,alu_out,readData2,data_in; //32
logic mem_write;  //1
bit clk,rst;

top t1(instruction,clk,rst,data_in,pc,alu_out,readData2,mem_write);
data_memory d_mem(alu_out, readData2,mem_write,clk,data_in);
inst_memory i_mem(pc,instruction );

initial begin
rst=1;
#10;
rst=0;
#250;
$finish;
end

always begin 
#5 clk = ~clk; 
end

endmodule
