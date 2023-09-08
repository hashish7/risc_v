module data_path(input wire [31:0] inst,
                 input wire [31:0] data_in,  //data memory output
                 input wire clk,result_src,alu_src,reg_write,link, 
                 input wire [1:0] pc_src,imm_src,
                 input wire [2:0]  alu_op,
                 input wire sel,rst,
                 
                 
                 output reg [31:0] pc,
                 output wire [31:0] readData2,       // connect with data memory write port
                 output wire signed [31:0] alu_out  // connect with data memory read port
    );
    wire signed [31:0]  src_a, src_b;
    reg [31:0] pc_next;
    wire [31:7] in;
    wire [31:0] ext_out;
    wire [2:0] func3;
    wire zero ,branch;
    wire [4:0] writeReg, readReg1, readReg2;
    wire [31:0] wReg_src, result,pc4,pcx;
    ////////////////////
    
    alu alu1(src_a, src_b ,alu_op,sel,alu_out,zero);
    extend extend1(in,imm_src,ext_out);
    RegFile reg_file (writeReg, readReg1, readReg2,clk, reg_write, wReg_src, src_a, readData2);
    
    assign result = result_src? data_in : alu_out; // alu or data memory MUX
    assign src_b = alu_src? ext_out : readData2;  // alu source MUX
    assign wReg_src = link ? pc4 : result;       // reg_file write port input MUX
    
    assign in = inst[31:7];
    assign writeReg = inst[11:7];
    assign readReg1 = inst[19:15];
    assign readReg2 = inst[24:20];
    assign func3 = inst[14:12];
    assign pc4 = pc + 4;
    assign pcx = pc + ext_out;  
    assign branch = ((~func3[0] & zero)|(func3[0] & ~zero)) ;
    
    always @(*) begin
    
        case(pc_src)
            2'b00 : pc_next = pc4;
            2'b01 : pc_next = pcx;// jal
            2'b10 : pc_next = alu_out;  //jalr
            2'b11 : pc_next = branch ? pcx : pc4 ;
            default : pc_next = pc4;
        endcase
    end 
    
    always @(posedge clk) begin
         if(rst) pc <= 0;
         else pc <= pc_next;  
        end
endmodule
