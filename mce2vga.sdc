## Generated SDC file "mce2vga.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

## DATE    "Sat Sep 09 18:29:17 2017"

##
## DEVICE  "EP4CE6E22C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLK}]


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************
#PLL2
set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]

set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
#PLL1
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}]  -add_delay  0.075 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]

set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]
set_input_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}]  -max 		 0.125 [get_ports {V SW3 SW2 SW1 SW0 SR SG SB PR PG PB H RESET SRAM_DQ15 SRAM_DQ14 SRAM_DQ13 SRAM_DQ12 SRAM_DQ11 SRAM_DQ10 SRAM_DQ9 SRAM_DQ8 SRAM_DQ7 SRAM_DQ6 SRAM_DQ5 SRAM_DQ4 SRAM_DQ3 SRAM_DQ2 SRAM_DQ1 SRAM_DQ0 UP_BTN DOWN_BTN LEFT_BTN RIGHT_BTN}]

##**************************************************************
## Set Output Delay
##**************************************************************
#PLL2
set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]

set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
#PLL1
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}]  -add_delay 0.075 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]

set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]
set_output_delay -clock [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}]  -max       0.125 [get_ports {B0 B1 B2 B3 G0 G1 G2 G3 HSYNC R0 R1 R2 R3 SRAM_ADDR0 SRAM_ADDR1 SRAM_ADDR2 SRAM_ADDR3 SRAM_ADDR4 SRAM_ADDR5 SRAM_ADDR6 SRAM_ADDR7 SRAM_ADDR8 SRAM_ADDR9 SRAM_ADDR10 SRAM_ADDR11 SRAM_ADDR12 SRAM_ADDR13 SRAM_ADDR14 SRAM_ADDR15 SRAM_ADDR16 SRAM_ADDR17 SRAM_DQ0 SRAM_DQ1 SRAM_DQ2 SRAM_DQ3 SRAM_DQ4 SRAM_DQ5 SRAM_DQ6 SRAM_DQ7 SRAM_DQ8 SRAM_DQ9 SRAM_DQ10 SRAM_DQ11 SRAM_DQ12 SRAM_DQ13 SRAM_DQ14 SRAM_DQ15 SRAM_LB SRAM_OE SRAM_UB SRAM_WE SRAM_CE VSYNC LED0 LED1 LED2 LED3}]



#**************************************************************
# Set Clock Groups
#**************************************************************
#PLL1
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 

set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] 


#PLL2
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}]
 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 

set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] 

set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 

set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[1]}] 

set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[1]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[2]}] 
set_clock_groups -asynchronous -group [get_clocks {pll2|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[3]}] 


#**************************************************************
# Set False Path
#**************************************************************

# CGA
set_false_path -from {sram:cga_sram|SramCe} -to {SRAM_CE}
set_false_path -from {sram:cga_sram|SramOe} -to {SRAM_OE}
set_false_path -from {sram:cga_sram|SramWe} -to {SRAM_WE}
set_false_path -from {sram:cga_sram|SramUB} -to {SRAM_UB}
set_false_path -from {sram:cga_sram|SramLB} -to {SRAM_LB}

set_false_path -from {sram:cga_sram|SramAdr[17]} -to {SRAM_ADDR17}
set_false_path -from {sram:cga_sram|SramAdr[16]} -to {SRAM_ADDR16}
set_false_path -from {sram:cga_sram|SramAdr[15]} -to {SRAM_ADDR15}
set_false_path -from {sram:cga_sram|SramAdr[14]} -to {SRAM_ADDR14}
set_false_path -from {sram:cga_sram|SramAdr[13]} -to {SRAM_ADDR13}
set_false_path -from {sram:cga_sram|SramAdr[12]} -to {SRAM_ADDR12}
set_false_path -from {sram:cga_sram|SramAdr[11]} -to {SRAM_ADDR11}
set_false_path -from {sram:cga_sram|SramAdr[10]} -to {SRAM_ADDR10}
set_false_path -from {sram:cga_sram|SramAdr[9]} -to {SRAM_ADDR9}
set_false_path -from {sram:cga_sram|SramAdr[8]} -to {SRAM_ADDR8}
set_false_path -from {sram:cga_sram|SramAdr[7]} -to {SRAM_ADDR7}
set_false_path -from {sram:cga_sram|SramAdr[6]} -to {SRAM_ADDR6}
set_false_path -from {sram:cga_sram|SramAdr[5]} -to {SRAM_ADDR5}
set_false_path -from {sram:cga_sram|SramAdr[4]} -to {SRAM_ADDR4}
set_false_path -from {sram:cga_sram|SramAdr[3]} -to {SRAM_ADDR3}
set_false_path -from {sram:cga_sram|SramAdr[2]} -to {SRAM_ADDR2}
set_false_path -from {sram:cga_sram|SramAdr[1]} -to {SRAM_ADDR1}
set_false_path -from {sram:cga_sram|SramAdr[0]} -to {SRAM_ADDR0}

set_false_path -from {sram:cga_sram|SramDat[15]} -to {SRAM_DQ15}
set_false_path -from {sram:cga_sram|SramDat[14]} -to {SRAM_DQ14}
set_false_path -from {sram:cga_sram|SramDat[13]} -to {SRAM_DQ13}
set_false_path -from {sram:cga_sram|SramDat[12]} -to {SRAM_DQ12}
set_false_path -from {sram:cga_sram|SramDat[11]} -to {SRAM_DQ11}
set_false_path -from {sram:cga_sram|SramDat[10]} -to {SRAM_DQ10}
set_false_path -from {sram:cga_sram|SramDat[9]} -to {SRAM_DQ9}
set_false_path -from {sram:cga_sram|SramDat[8]} -to {SRAM_DQ8}
set_false_path -from {sram:cga_sram|SramDat[7]} -to {SRAM_DQ7}
set_false_path -from {sram:cga_sram|SramDat[6]} -to {SRAM_DQ6}
set_false_path -from {sram:cga_sram|SramDat[5]} -to {SRAM_DQ5}
set_false_path -from {sram:cga_sram|SramDat[4]} -to {SRAM_DQ4}
set_false_path -from {sram:cga_sram|SramDat[3]} -to {SRAM_DQ3}
set_false_path -from {sram:cga_sram|SramDat[2]} -to {SRAM_DQ2}
set_false_path -from {sram:cga_sram|SramDat[1]} -to {SRAM_DQ1}
set_false_path -from {sram:cga_sram|SramDat[0]} -to {SRAM_DQ0}

set_false_path -from {sram:cga_sram|SramAdr[14]~en} -to {SRAM_ADDR14}
set_false_path -from {sram:cga_sram|SramAdr[8]~en} -to {SRAM_ADDR8}
set_false_path -from {sram:cga_sram|SramCe~en} -to {SRAM_CE}
set_false_path -from {sram:cga_sram|SramDat[0]~en} -to {SRAM_DQ0}

set_false_path -from {sync_level:cga_sync_level|video_enable} -to [get_ports {LED0}]
set_false_path -from {sync_level:cga_sync_level|video_enable} -to [get_ports {LED1}]
set_false_path -from {sync_level:cga_sync_level|video_enable} -to [get_ports {LED2}]
set_false_path -from {sync_level:cga_sync_level|video_enable} -to [get_ports {LED3}]
set_false_path -from {sync_level:cga_sync_level|no_video} -to [get_ports {LED0}]
set_false_path -from {sync_level:cga_sync_level|no_video} -to [get_ports {LED1}]
set_false_path -from {sync_level:cga_sync_level|no_video} -to [get_ports {LED2}]
set_false_path -from {sync_level:cga_sync_level|no_video} -to [get_ports {LED3}]

# EGA
set_false_path -from {sram:ega_sram|SramCe} -to {SRAM_CE}
set_false_path -from {sram:ega_sram|SramOe} -to {SRAM_OE}
set_false_path -from {sram:ega_sram|SramWe} -to {SRAM_WE}
set_false_path -from {sram:ega_sram|SramUB} -to {SRAM_UB}
set_false_path -from {sram:ega_sram|SramLB} -to {SRAM_LB}

set_false_path -from {sram:ega_sram|SramAdr[17]} -to {SRAM_ADDR17}
set_false_path -from {sram:ega_sram|SramAdr[16]} -to {SRAM_ADDR16}
set_false_path -from {sram:ega_sram|SramAdr[15]} -to {SRAM_ADDR15}
set_false_path -from {sram:ega_sram|SramAdr[14]} -to {SRAM_ADDR14}
set_false_path -from {sram:ega_sram|SramAdr[13]} -to {SRAM_ADDR13}
set_false_path -from {sram:ega_sram|SramAdr[12]} -to {SRAM_ADDR12}
set_false_path -from {sram:ega_sram|SramAdr[11]} -to {SRAM_ADDR11}
set_false_path -from {sram:ega_sram|SramAdr[10]} -to {SRAM_ADDR10}
set_false_path -from {sram:ega_sram|SramAdr[9]} -to {SRAM_ADDR9}
set_false_path -from {sram:ega_sram|SramAdr[8]} -to {SRAM_ADDR8}
set_false_path -from {sram:ega_sram|SramAdr[7]} -to {SRAM_ADDR7}
set_false_path -from {sram:ega_sram|SramAdr[6]} -to {SRAM_ADDR6}
set_false_path -from {sram:ega_sram|SramAdr[5]} -to {SRAM_ADDR5}
set_false_path -from {sram:ega_sram|SramAdr[4]} -to {SRAM_ADDR4}
set_false_path -from {sram:ega_sram|SramAdr[3]} -to {SRAM_ADDR3}
set_false_path -from {sram:ega_sram|SramAdr[2]} -to {SRAM_ADDR2}
set_false_path -from {sram:ega_sram|SramAdr[1]} -to {SRAM_ADDR1}
set_false_path -from {sram:ega_sram|SramAdr[0]} -to {SRAM_ADDR0}

set_false_path -from {sram:ega_sram|SramDat[15]} -to {SRAM_DQ15}
set_false_path -from {sram:ega_sram|SramDat[14]} -to {SRAM_DQ14}
set_false_path -from {sram:ega_sram|SramDat[13]} -to {SRAM_DQ13}
set_false_path -from {sram:ega_sram|SramDat[12]} -to {SRAM_DQ12}
set_false_path -from {sram:ega_sram|SramDat[11]} -to {SRAM_DQ11}
set_false_path -from {sram:ega_sram|SramDat[10]} -to {SRAM_DQ10}
set_false_path -from {sram:ega_sram|SramDat[9]} -to {SRAM_DQ9}
set_false_path -from {sram:ega_sram|SramDat[8]} -to {SRAM_DQ8}
set_false_path -from {sram:ega_sram|SramDat[7]} -to {SRAM_DQ7}
set_false_path -from {sram:ega_sram|SramDat[6]} -to {SRAM_DQ6}
set_false_path -from {sram:ega_sram|SramDat[5]} -to {SRAM_DQ5}
set_false_path -from {sram:ega_sram|SramDat[4]} -to {SRAM_DQ4}
set_false_path -from {sram:ega_sram|SramDat[3]} -to {SRAM_DQ3}
set_false_path -from {sram:ega_sram|SramDat[2]} -to {SRAM_DQ2}
set_false_path -from {sram:ega_sram|SramDat[1]} -to {SRAM_DQ1}
set_false_path -from {sram:ega_sram|SramDat[0]} -to {SRAM_DQ0}

set_false_path -from {sram:ega_sram|SramAdr[14]~en} -to {SRAM_ADDR14}
set_false_path -from {sram:ega_sram|SramAdr[8]~en} -to {SRAM_ADDR8}
set_false_path -from {sram:ega_sram|SramCe~en} -to {SRAM_CE}
set_false_path -from {sram:ega_sram|SramDat[0]~en} -to {SRAM_DQ0}

set_false_path -from {sync_level:ega_sync_level|video_enable} -to [get_ports {LED0}]
set_false_path -from {sync_level:ega_sync_level|video_enable} -to [get_ports {LED1}]
set_false_path -from {sync_level:ega_sync_level|video_enable} -to [get_ports {LED2}]
set_false_path -from {sync_level:ega_sync_level|video_enable} -to [get_ports {LED3}]
set_false_path -from {sync_level:ega_sync_level|no_video} -to [get_ports {LED0}]
set_false_path -from {sync_level:ega_sync_level|no_video} -to [get_ports {LED1}]
set_false_path -from {sync_level:ega_sync_level|no_video} -to [get_ports {LED2}]
set_false_path -from {sync_level:ega_sync_level|no_video} -to [get_ports {LED3}]

# MDA
set_false_path -from {sram:mda_sram|SramCe} -to {SRAM_CE}
set_false_path -from {sram:mda_sram|SramOe} -to {SRAM_OE}
set_false_path -from {sram:mda_sram|SramWe} -to {SRAM_WE}
set_false_path -from {sram:mda_sram|SramUB} -to {SRAM_UB}
set_false_path -from {sram:mda_sram|SramLB} -to {SRAM_LB}

set_false_path -from {sram:mda_sram|SramAdr[17]} -to {SRAM_ADDR17}
set_false_path -from {sram:mda_sram|SramAdr[16]} -to {SRAM_ADDR16}
set_false_path -from {sram:mda_sram|SramAdr[15]} -to {SRAM_ADDR15}
set_false_path -from {sram:mda_sram|SramAdr[14]} -to {SRAM_ADDR14}
set_false_path -from {sram:mda_sram|SramAdr[13]} -to {SRAM_ADDR13}
set_false_path -from {sram:mda_sram|SramAdr[12]} -to {SRAM_ADDR12}
set_false_path -from {sram:mda_sram|SramAdr[11]} -to {SRAM_ADDR11}
set_false_path -from {sram:mda_sram|SramAdr[10]} -to {SRAM_ADDR10}
set_false_path -from {sram:mda_sram|SramAdr[9]} -to {SRAM_ADDR9}
set_false_path -from {sram:mda_sram|SramAdr[8]} -to {SRAM_ADDR8}
set_false_path -from {sram:mda_sram|SramAdr[7]} -to {SRAM_ADDR7}
set_false_path -from {sram:mda_sram|SramAdr[6]} -to {SRAM_ADDR6}
set_false_path -from {sram:mda_sram|SramAdr[5]} -to {SRAM_ADDR5}
set_false_path -from {sram:mda_sram|SramAdr[4]} -to {SRAM_ADDR4}
set_false_path -from {sram:mda_sram|SramAdr[3]} -to {SRAM_ADDR3}
set_false_path -from {sram:mda_sram|SramAdr[2]} -to {SRAM_ADDR2}
set_false_path -from {sram:mda_sram|SramAdr[1]} -to {SRAM_ADDR1}
set_false_path -from {sram:mda_sram|SramAdr[0]} -to {SRAM_ADDR0}

set_false_path -from {sram:mda_sram|SramDat[15]} -to {SRAM_DQ15}
set_false_path -from {sram:mda_sram|SramDat[14]} -to {SRAM_DQ14}
set_false_path -from {sram:mda_sram|SramDat[13]} -to {SRAM_DQ13}
set_false_path -from {sram:mda_sram|SramDat[12]} -to {SRAM_DQ12}
set_false_path -from {sram:mda_sram|SramDat[11]} -to {SRAM_DQ11}
set_false_path -from {sram:mda_sram|SramDat[10]} -to {SRAM_DQ10}
set_false_path -from {sram:mda_sram|SramDat[9]} -to {SRAM_DQ9}
set_false_path -from {sram:mda_sram|SramDat[8]} -to {SRAM_DQ8}
set_false_path -from {sram:mda_sram|SramDat[7]} -to {SRAM_DQ7}
set_false_path -from {sram:mda_sram|SramDat[6]} -to {SRAM_DQ6}
set_false_path -from {sram:mda_sram|SramDat[5]} -to {SRAM_DQ5}
set_false_path -from {sram:mda_sram|SramDat[4]} -to {SRAM_DQ4}
set_false_path -from {sram:mda_sram|SramDat[3]} -to {SRAM_DQ3}
set_false_path -from {sram:mda_sram|SramDat[2]} -to {SRAM_DQ2}
set_false_path -from {sram:mda_sram|SramDat[1]} -to {SRAM_DQ1}
set_false_path -from {sram:mda_sram|SramDat[0]} -to {SRAM_DQ0}

set_false_path -from {sram:mda_sram|SramAdr[14]~en} -to {SRAM_ADDR14}
set_false_path -from {sram:mda_sram|SramAdr[8]~en} -to {SRAM_ADDR8}
set_false_path -from {sram:mda_sram|SramCe~en} -to {SRAM_CE}
set_false_path -from {sram:mda_sram|SramDat[0]~en} -to {SRAM_DQ0}

set_false_path -from {sync_level:mda_sync_level|video_enable} -to [get_ports {LED0}]
set_false_path -from {sync_level:mda_sync_level|video_enable} -to [get_ports {LED1}]
set_false_path -from {sync_level:mda_sync_level|video_enable} -to [get_ports {LED2}]
set_false_path -from {sync_level:mda_sync_level|video_enable} -to [get_ports {LED3}]
set_false_path -from {sync_level:mda_sync_level|no_video} -to [get_ports {LED0}]
set_false_path -from {sync_level:mda_sync_level|no_video} -to [get_ports {LED1}]
set_false_path -from {sync_level:mda_sync_level|no_video} -to [get_ports {LED2}]
set_false_path -from {sync_level:mda_sync_level|no_video} -to [get_ports {LED3}]


set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[2]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[3]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[4]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[5]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[6]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[7]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[8]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[9]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[10]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[11]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[12]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[13]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[14]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_pixel_queue[15]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[0]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[0]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[1]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[2]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[3]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[4]}
set_false_path -from {cga_genlock:cga_genlock|s_phase[1]} -to {cga_genlock:cga_genlock|s_rgbcomp[5]}

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

