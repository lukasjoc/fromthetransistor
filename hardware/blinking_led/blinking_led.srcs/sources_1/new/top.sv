`timescale 1ns / 1ps

// TODO: rgb blinking controlled by what type of switch is turned on
// all turned on led blinks in red green and blue and so on
module top(
    input
        i_clk, // the clock
        i_sw0, i_sw1, i_sw2, i_sw3, // all users switches
    output
        o_led0, o_led1, o_led2, o_led3, // all user leds
        o_led_r, o_led_g, o_led_b // one rgb led
    );
   
// rgb_blink_sw_control inst_rgb_blink_sw_control(
//      i_clk,
//      i_sw0, i_sw1, i_sw2,
//      i_led_r, i_led_g, i_led_b
// );

    led_blink inst_led_blink(i_clk, o_led1);
    led_blink_odd led_blink_odd(i_clk, o_led2);
    on_sw_led_blink inst_on_sw_led_blink(i_clk, i_sw3, o_led3);
endmodule

// just blink at 2^24 around every third of a second
module led_blink(input i_clk, output [1:0]o_led );
reg o_led = 1'b1;
reg [31:0]cnt;
always @(posedge i_clk ) begin
    cnt <= cnt +1'b1;
    o_led <= cnt[24];
end
endmodule

// blink at odd posedges
module led_blink_odd(input i_clk, output [1:0]o_led );
reg [31:0] cnt;
reg o_led = 1'b0;
reg state = 1'b0;
always @(posedge i_clk) begin
    state <= state + 1'b1;
    if(state % 2 != 0) begin
        cnt <= cnt +1'b1;
        o_led <= cnt[24];
    end
end
endmodule

// blink if switch is on
module on_sw_led_blink(input i_clk, i_sw, output [1:0]o_led );
reg [32:0] cnt;
reg o_led = 1'b0;
always @(posedge i_clk) begin
    if(i_sw) begin 
        cnt <= cnt +1'b1;
        o_led <= cnt[24];
    end else begin
        cnt <= 0;
        o_led <= 0;
    end
end
endmodule

//module rgb_blink_sw_control(
//    input
//        i_clk, i_sw,
//    output
//      o_led_r, o_led_g, o_led_b
//   );
//endmodule

