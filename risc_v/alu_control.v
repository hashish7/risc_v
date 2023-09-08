module alu_cntr (input [1:0] alu_op,
                 input func7,           //1 bit --> func7[5]
                 input [2:0] func3,
                 output reg  [2:0] op ,
                 output reg  sel);
                 wire sel_aluR,sel_aluI;
always@(*) begin
		case(alu_op)
			2'b00: begin op = func3;  sel = sel_aluR;end  // R type
			2'b01: begin op = func3;  sel = sel_aluI ;end //  I type 
			2'b10: begin op = 3'b000;  sel = 1'b1;end    //  b type
			2'b11: begin op = 3'b000;  sel = 1'b0;end    //  s type and lw operation
			
			default: begin op <= func3;  sel <= 1'b0;end  //should not happen
		endcase
	end
	assign sel_aluR = (func7&(~func3[0]&~func3[1]&~func3[2]))|sel_aluI ;
    assign sel_aluI = (func7&(func3[0]&~func3[1]&func3[2]))
                          |(~func3[0]&func3[1]&~func3[2])|(func3[0]&func3[1]&~func3[2]);
endmodule
