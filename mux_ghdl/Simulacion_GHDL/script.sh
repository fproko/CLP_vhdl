ghdl -a ../Fuentes/mux.vhd ../Fuentes/mux_tb.vhd # Analyze one or multiple VHDL files
ghdl -s ../Fuentes/mux.vhd ../Fuentes/mux_tb.vhd # Check syntax of FILEs
ghdl -e mux_tb  # Elaborate design UNIT
ghdl -r mux_tb --vcd=mux_tb.vcd --stop-time=50ns # Run design UNIT
gtkwave mux_tb.vcd
