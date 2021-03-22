
// d register logic
module d_register_rising(input d, r, clk, output reg q, invq);
assign invq = ~q;
always @(posedge clk or negedge r)
  if (!r)
    q <= 0;
  else
    q <= d;

initial $display("D-Risnig_cLK Register working");
endmodule

// jk register logic
module jk_register(input j, k, clk, output reg q);
always @(posedge clk)
  case ({j,k})
    2'b00 : q <= q;
    2'b01 : q <= 0;
    2'b10 : q <= 1;
    2'b11 : q <= ~q;
endcase

initial $display("JK Register working");
endmodule

module dff(input i_1, i_2, r, clk, output q1, q, invq);
  d_register_rising dregsiterrising(i_1, r, clk, q, invq);
  jk_register jkregister(i_1, i_2, clk, q1);
  initial $finish;
endmodule
