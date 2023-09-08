module extend(input wire [31:7] in,
                input wire [1:0] type,
               output reg [31:0] out);
       localparam i_type = 2'b00;
       localparam s_type = 2'b01;
       localparam b_type = 2'b10;
       localparam j_type = 2'b11;
       wire [11:0] i , s , b; 
       wire [19:0] j; 
       assign i = in[31:20];
       assign s = {in[31:25],in[11:7]};
       assign b = {in[31],in[7],in[30:25],in[11:8],1'b0};
       assign j = {in[31],in[19:12],in[20],in[30:21],1'b0};
       always@(*)begin
           case(type)  
               i_type : out = i[11]? { 20'hfffff,i} :{ 20'h00000,i};
               s_type : out = s[11]? { 20'hfffff,s} :{ 20'h00000,s};
               b_type : out = b[11]? { 20'hfffff,b} :{ 20'h00000,b};
               j_type : out = j[19]? { 12'hfff,j} :{ 12'h000,j};
               default: out = i[11]? { 20'hfffff,i} :{ 20'h00000,i};
           endcase 
       end
endmodule

