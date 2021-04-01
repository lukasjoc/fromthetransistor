`timescale 1ns / 1ps

// TODO: click button led goes on and blinks
// TODO: rgb blinking
// TODO: blinking with a time span
module top(input i_clk, i_sw, output o_led);
reg [31:0] counter = 32'b0;
reg o_led = 1;

always @(posedge i_clk) begin
    if(i_sw) begin
        counter <= counter + 1'b1;
    end
o_led <= (counter == 32) ? ~o_led : o_led;
end
endmodule