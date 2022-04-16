ghdl -a ../Fuentes/neg.vhd ../Fuentes/neg_tb.vhd # Analyze one or multiple VHDL files
ghdl -s ../Fuentes/neg.vhd ../Fuentes/neg_tb.vhd # Check syntax of FILEs
ghdl -e neg_tb  # Elaborate design UNIT
ghdl -r neg_tb --vcd=neg_tb.vcd --stop-time=1000ns # Run design UNIT
gtkwave neg_tb.vcd
