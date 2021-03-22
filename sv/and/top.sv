// simple and gate
module top(input i_a, i_b, output o_c);

m_andgate mymandgate(i_a, i_b, o_c);
m_orgate mymorgate(i_a, i_b, o_c);
m_norgate mymnorgate(i_a, i_b, o_c);

initial $finish;

endmodule

// simple and gate
module m_andgate(input i_a, i_b, output o_c);

wire w_and;
assign w_and = i_a & i_b;

// blocking assignment
assign o_c = w_and;

initial begin
  $display("AND gate working");
end
endmodule

// simple or gate
module m_orgate(input i_a, i_b, output o_c);

wire w_or;
assign w_or = i_a | i_b;

// blocking assignment
assign o_c = w_or;

initial begin
  $display("OR gate working");
end
endmodule


// simple NOR gate
module m_norgate(input i_a, i_b, output o_c);

wire w_nor;

assign w_nor = i_a ~| i_b;

assign o_c = w_nor;

initial begin
  $display("NOR gate working");
end
endmodule

