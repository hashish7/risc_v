module top(input wire [31:0] inst,
                 input wire clk,rst,
                 input wire [31:0] data_in,          // connect with data memory read port
                 
                 output wire [31:0] pc,               // connect with instruction memory address
                 output wire signed [31:0] alu_out,  // connect with data memory write port address
                 output wire [31:0] readData2,       // connect with data memory write port data
                 output wire mem_write);
                 
    wire [1:0]  alu_cnt,imm_src,pc_src;
    wire [6:0] op_code;
    wire [2:0] func3,alu_op;
    wire result_src,alu_src,reg_write,link,sel;
    
control_path cont_path(inst,result_src,alu_src,reg_write,link,mem_write,pc_src,imm_src,alu_op ,sel );
data_path d_path(inst,data_in,clk,result_src,alu_src,reg_write,link, pc_src,imm_src,alu_op,sel,rst, pc,readData2,alu_out);
    
endmodule