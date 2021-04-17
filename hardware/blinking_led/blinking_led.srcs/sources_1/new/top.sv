`timescale 1ns / 1ps

// TODO: click button led goes on and blinks
// TOOD: blink normal led with switch of button
// TODO: rgb blinking controlled by what type of switch is turned on
// all turned on led blinks in red green and blue and so on
module top(input i_clk, output o_led);
    led_blink inst_led_blink(i_clk, o_led);
endmodule

module led_blink( input i_clk, output [1:0]o_led );
reg on_bit = 1'b1;
reg [32:0]cnt;
reg state;

assign o_led[0] = state;
assign o_led[1] = on_bit;
always @(posedge i_clk) begin
    cnt <= cnt +1;
    state <= cnt[24];
end
endmodule