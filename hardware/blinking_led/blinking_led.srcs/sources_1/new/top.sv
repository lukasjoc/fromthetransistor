`timescale 1ns / 1ps

module top(
    input
        // the main clock
        i_clk,
        // all users switches
        i_sw0, i_sw1, i_sw2, i_sw3,

        // user buttons
        i_btn0,
    output
        // all user leds
        o_led0, o_led1, o_led2, o_led3,
        // one rgb user led
        o_led_r, o_led_g, o_led_b
    );
    // blinking rgb led with switches
    rgb_blink_sw_control inst_rgb_blink_sw_control(
        .i_clk(i_clk),
        .i_sw_r(i_sw0),
        .i_sw_g(i_sw1),
        .i_sw_b(i_sw2),
        .o_led_r(o_led_r),
        .o_led_g(o_led_g),
        .o_led_b(o_led_b)
    );

    // just blinking
    led_blink inst_led_blink(
        .i_clk(i_clk),
        .o_led(o_led1)
    );
    // blinking at odd states
    led_blink_odd inst_led_blink_odd(
        .i_clk(i_clk),
        .o_led(o_led2)
    );
    // blinking if switch is turned on
    on_sw_led_blink inst_on_sw_led_blink(
        .i_clk(i_clk),
        .i_sw(i_sw3),
        .o_led(o_led3)
    );
    on_btn_led_pwm inst_on_btn_led_pwm (
      .i_clk(i_clk),
      .i_btn(i_btn0),
      .o_led(o_led0)
    );
endmodule

// changing the brightness of a led
module on_btn_led_pwm(
    input i_clk, i_btn,
    output o_led
);

reg [3:0] i;
reg [4:0] pwm;

always @(posedge i_clk) begin
  if(i_btn) i <= i + 1;
  pwm <= pwm[3:0] + i;
end

assign o_led  = pwm[4];
endmodule

// just blink at 2^24 around every third of a second
module led_blink(
    input i_clk,
    output reg [1:0] o_led = 1'b1
);
reg [31:0] cnt;
always @(posedge i_clk ) begin
    cnt <= cnt +1'b1;
    o_led <= cnt[24];
end
endmodule

// blink at odd states
module led_blink_odd(
    input i_clk,
    output reg [1:0] o_led = 1'b0
    );
reg [31:0] cnt;
reg state = 1'b0;
always @(posedge i_clk) begin
    state <= state + 1'b1;
    if(state % 2 != 0) begin
        cnt <= cnt +1'b1;
        o_led <= cnt[24];
    end
end
endmodule

// blinking if switch is turned on
module on_sw_led_blink(
    input i_clk, i_sw,
    output reg [1:0] o_led = 1'b0
    );
reg [31:0] cnt;
always @(posedge i_clk) begin
    if(i_sw) begin 
        cnt <= cnt +1'b1;
        o_led <= cnt[24];
    end else begin
        cnt <= 1'b0;
        o_led <= 1'b0;
    end
end
endmodule

// blinking rgb led with switches
module rgb_blink_sw_control(
    input i_clk, i_sw_r, i_sw_g, i_sw_b,
    output
        reg [1:0]o_led_r = 1'b0,
        reg [1:0]o_led_g = 1'b0,
        reg [1:0]o_led_b = 1'b0
    );
reg [31:0] cnt_r;
reg [31:0] cnt_g;
reg [31:0] cnt_b;

always @(posedge i_clk) begin
    if(i_sw_r) begin
        cnt_r <= cnt_r +1'b1;
        o_led_r <= cnt_r[24];
    end else begin
        cnt_r <= 1'b0;
        o_led_r <= 1'b0;
    end
    if(i_sw_g) begin
        cnt_g <= cnt_g +1'b1;
        o_led_g <= cnt_g[25];
    end else begin
        cnt_g <= 1'b0;
        o_led_g <= 1'b0;
    end
    if(i_sw_b) begin
        cnt_b <= cnt_b +1'b1;
        o_led_b <= cnt_b[26];
    end else begin
        cnt_b <= 1'b0;
        o_led_b <= 1'b0;
    end
end
endmodule
