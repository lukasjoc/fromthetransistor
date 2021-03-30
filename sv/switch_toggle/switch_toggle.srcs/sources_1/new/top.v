`timescale 1ns / 1ps

// LED Toggle
// TODO: could not run the design and build the image
// fpga would not connect
// will buy 5v power barrel jack and new micro usb-b cable
// and try again :)
module top(input i_sw_0, output o_led_0);
assign o_led_0 = i_sw_0;
endmodule
