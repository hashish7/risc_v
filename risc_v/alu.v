module alu( input signed [31:0]  a , b ,
            input wire [2:0]  op,
            input wire sel,
            output reg signed [31:0] out,
            output wire zero);
            
            wire signed [31:0] add_out;
    always @(*)
    begin
      case(op)
           3'b000: out = add_out;                    //add or sub 
           3'b001: out = a << b;                     //sll
           3'b010: out = {31'd0 , add_out[31]};      //slt
           3'b011: out = {31'd0 , add_out[31]};      //sltu not valid
           3'b100: out = a ^ b;                      //XOR
           3'b101: out = sel? a >>> b : a >> b;      //sra or srl
           3'b110: out = a | b;                      //OR
           3'b111: out = a & b;                      //AND
        default : out = 32'bx;
        endcase
    end
  assign zero = ~(|out) ;
  ripple_carry_adder_subtractor ad(a,b,sel,add_out,);
endmodule
