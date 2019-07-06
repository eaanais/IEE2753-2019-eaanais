#!/bin/csh
set src = " \
./rtl/FIR.v \
./rtl/osu05_stdcells.v \
./rtl/fir2n_tb.v "



iverilog -o nuevo $src -v
vvp nuevo > log_fir_sintetizado.log
