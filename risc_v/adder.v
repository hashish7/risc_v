module fadd_b (input a,b, cin,
             output s, cout );
  assign {cout , s} = a + b + cin;
 endmodule 
//--------------------------------------------
module n_b_add #(parameter n = 32)
          (input [n-1: 0] a,b, 
           input cin,
           output [n-1: 0] s, 
           output cout );
  wire [n: 0] c;
  genvar i;
  generate
    for(i=0; i<n ; i=i+1)
      fadd_b f(a[i],b[i] ,c[i] , s[i] , c[i+1] );
  endgenerate
  assign c[0] = cin;
  assign cout = c[n]; 
  
 endmodule
