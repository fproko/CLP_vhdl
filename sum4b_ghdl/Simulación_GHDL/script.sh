ghdl -a ../../sum1b_ghdl/Fuentes/sum1b.vhd ../Fuentes/sum4b.vhd ../Fuentes/sum4b_tb.vhd
ghdl -s ../../sum1b_ghdl/Fuentes/sum1b.vhd ../Fuentes/sum4b.vhd ../Fuentes/sum4b_tb.vhd
ghdl -e sum4b_tb
ghdl -r sum4b_tb --vcd=sum4b_tb.vcd --stop-time=1000ns
gtkwave sum4b_tb.vcd
