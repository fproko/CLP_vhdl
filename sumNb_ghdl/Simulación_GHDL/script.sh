ghdl -a ../../sum1b_ghdl/Fuentes/sum1b.vhd ../Fuentes/sumNb.vhd ../Fuentes/sumNb_tb.vhd
ghdl -s ../../sum1b_ghdl/Fuentes/sum1b.vhd ../Fuentes/sumNb.vhd ../Fuentes/sumNb_tb.vhd
ghdl -e sumNb_tb
ghdl -r sumNb_tb --vcd=sumNb_tb.vcd --stop-time=1000ns
gtkwave sumNb_tb.vcd
