
// dff with reset pin
module dff_with_r(input d, r, clk, output reg q, invq);

assign invq = ~q;
always @(posedge clk or negedge r)
  if (!r)
    q <= 0;
  else
    q <= d;
endmodule

module dff(input d, r, clk, output q, invq);
  dff_with_r dff_r(d, r, clk, q, invq);
  initial $finish;
endmodule
