## ZYBO Z7
# Custom Pin Layout
## Clock signal
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { i_clk }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { i_clk }];

## Buttons
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { i_btn0 }];
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { i_btn1 }];

## Switches
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { i_sw0 }];
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { i_sw1 }];
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { i_sw2 }];
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { i_sw3 }];

## LED (non rgb)
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { o_led0 }];
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { o_led1 }];
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { o_led2 }];
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { o_led3 }];

## RGB LED 5 (Zybo Z7-20 only)
set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { o_led_r }];
set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { o_led_g }];
set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { o_led_b }];

