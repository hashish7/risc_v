module inst_memory(input wire [31:0] address,
                   output wire [31:0] instruction );
wire [31:0] ROM [0: 1024];
assign instruction = ROM[address[31:2]];
///////////////////demo program////////////////
assign ROM[0]=32'h00500113;
assign ROM[1]=32'h00C00193;
assign ROM[2]=32'hFF718393;
assign ROM[3]=32'h0023E233;
assign ROM[4]=32'h0041F2B3;
assign ROM[5]=32'h004282B3;
assign ROM[6]=32'h02728863;
assign ROM[7]=32'h0041A233;
assign ROM[8]=32'h00020463;
assign ROM[9]=32'h00000293;
assign ROM[10]=32'h0023A233;
assign ROM[11]=32'h005203B3;
assign ROM[12]=32'h402383B3;
assign ROM[13]=32'h0471AA23;
assign ROM[14]=32'h06002103;
assign ROM[15]=32'h005104B3;
assign ROM[16]=32'h008001EF;
assign ROM[17]=32'h00100113;
assign ROM[18]=32'h00910133;
assign ROM[19]=32'h0221A023;
assign ROM[20]=32'h00210063;
//////////////////////////////////////////////

endmodule