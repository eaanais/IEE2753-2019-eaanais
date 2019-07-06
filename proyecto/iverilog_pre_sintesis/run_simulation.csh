#!/bin/csh
set src = " \
./rtl/adder.v \
./rtl/asr8.v \
./rtl/counter_down.v \
./rtl/counter_up.v \
./rtl/divisor_clock.v \
./rtl/FIR.v \
./rtl/MAC.v \
./rtl/register.v \
./rtl/register_asr.v \
./rtl/retardo_N.v \
./rtl/rom8.v \
./rtl/fir2n_tb.v "



iverilog -o nuevo $src -v
vvp nuevo > log_fir.log
