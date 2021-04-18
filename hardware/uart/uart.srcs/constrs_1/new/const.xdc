## ZYBO Z7
# Custom Pin Layout

## Clock signal
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { i_clk }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { i_clk }];

## UART bridge PIN
set_property -dict {PACKAGE_PIN J12 IOSTANDARD LVCMOS33 } [get_ports { i_serial }];

## LED (non rgb)
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { o_led0 }];

