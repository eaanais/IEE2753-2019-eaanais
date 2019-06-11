#!/bin/csh
set src = " \
./rtl/mips.v \
./rtl/mips_tb.v \
./rtl/osu035_stdcells.v \
./rtl/memory.v "


iverilog -o sintesis $src -v
vvp sintesis
