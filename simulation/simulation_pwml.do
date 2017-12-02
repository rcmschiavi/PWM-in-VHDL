# Reading C:/intelFPGA_pro/17.0/modelsim_ase/tcl/vsim/pref.tcl
# do PWM_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 10.5c Lib Mapping Utility 2017.01 Jan 23 2017
# vmap work rtl_work 
# Copying C:/intelFPGA_pro/17.0/modelsim_ase/win32aloem/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
# vcom -93 -work work {C:/intelFPGA_lite/17.0/pwm_fio/PWM.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 10.5c Compiler 2017.01 Jan 23 2017
# Start time: 19:17:32 on Nov 24,2017
# vcom -reportprogress 300 -93 -work work C:/intelFPGA_lite/17.0/pwm_fio/PWM.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package std_logic_arith
# -- Loading package STD_LOGIC_UNSIGNED
# -- Loading package NUMERIC_STD
# -- Compiling entity PWM
# -- Compiling architecture modulation of PWM
# End time: 19:17:32 on Nov 24,2017, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
vsim work.pwm
# vsim work.pwm 
# Start time: 19:17:34 on Nov 24,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading ieee.numeric_std(body)
# Loading work.pwm(modulation)
add wave -position end  sim:/pwm/PWM
add wave -position 0  sim:/pwm/clk
add wave -position end  sim:/pwm/razao
add wave -position end  sim:/pwm/signal_pwm
force -freeze sim:/pwm/clk 1 0, 0 {5 ps} -r 10
run -all
force -freeze sim:/pwm/razao 00000000 0
run -all
force -freeze sim:/pwm/razao 11111111 0
run -all
force -freeze sim:/pwm/razao 10000000 0
run -all
force -freeze sim:/pwm/razao 00000100 0
run -all
