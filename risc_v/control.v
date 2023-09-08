module control_path(input wire [31:0] inst,

                 output wire result_src,alu_src,reg_write,link,mem_write, 
                 output wire [1:0] pc_src,imm_src,
                 output wire [2:0] alu_op ,
                 output wire sel
    );
    wire [1:0]  alu_cnt;
    wire [6:0] op_code;
    wire [2:0] func3;
    wire func7;
    
    control_decode cont(op_code,alu_src,reg_write,mem_write,link,result_src,alu_cnt,imm_src,pc_src);
    alu_cntr alu_cont(alu_cnt,func7,func3,alu_op ,sel);
    
    assign func7 = inst[30];
    assign func3 = inst[14:12];
    assign op_code = inst[6:0];

endmodule
