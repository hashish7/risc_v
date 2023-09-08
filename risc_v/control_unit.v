module control_decode  (input   wire     [6:0]        op,
                         output  reg                  alu_src,
                         output  reg                  reg_write,
                         output  reg                  mem_write,
                         output  reg                  link,
                         output  reg                  result_src, 
                         output  reg      [1:0]       alu_op,
                         output  reg      [1:0]       imm_src,
                         output  reg      [1:0]       pc_src );
localparam r    = 51;  localparam i    = 19; localparam lw   = 3;   localparam jalr = 103;
localparam b    = 99;  localparam jal  = 111; localparam sw   = 35;
always@(*)
begin
 case(op)                                                                      //pc_r_w_o_s_imm_reg  
  r       : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b00_0_0_00_0_00_1_0;          
  i       : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b00_0_0_01_1_00_1_0; 
  lw      : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b00_1_0_11_1_00_1_0; 
  jalr    : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b10_0_0_01_1_00_1_1; 
  b       : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b11_0_0_10_0_10_0_0;
  jal     : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b01_0_0_00_0_11_1_1; 
  sw      : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b00_0_1_11_1_01_0_0; 
  default : {pc_src,result_src,mem_write,alu_op,alu_src,imm_src,reg_write,link} = 11'b00_0_0_00_0_00_0_0; 
  endcase            
 end 
endmodule