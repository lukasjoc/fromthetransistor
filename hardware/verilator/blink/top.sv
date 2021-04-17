module top(input clk, reset, output reg led);

reg [31:0] counter;
reg clkout;

always @(posedge clk)
  if(counter == 0) begin
    counter <= 149999999;
    clkout <= ~clkout;
  end else begin
    counter <= counter - 1;
end

initial begin
  $display("Hello world");
  $finish;
end

endmodule
