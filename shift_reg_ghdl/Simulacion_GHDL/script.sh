ghdl -a ../Fuentes/shift_reg.vhd ../Fuentes/shift_reg_tb.vhd # Analyze one or multiple VHDL files
ghdl -s ../Fuentes/shift_reg.vhd ../Fuentes/shift_reg_tb.vhd # Check syntax of FILEs
ghdl -e shift_reg_tb  # Elaborate design UNIT
ghdl -r shift_reg_tb --vcd=shift_reg_tb.vcd --stop-time=1000ns # Run design UNIT
gtkwave shift_reg_tb.vcd
