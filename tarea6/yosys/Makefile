
synth.v: flow.ys example.constr osu035_stdcells.lib osu035_stdcells.v
		yosys -l flow.log flow.ys

osu035_stdcells.lib:
		rm -f osu035_stdcells.lib.part osu035_stdcells.lib
		wget -O osu035_stdcells.lib.part https://vlsiarch.ecen.okstate.edu/flows/MOSIS_SCMOS/latest/cadence/lib/ami035/signalstorm/osu035_stdcells.lib	
		mv osu035_stdcells.lib.part osu035_stdcells.lib

osu035_stdcells.v:
		rm -f osu035_stdcells.v.part osu035_stdcells.v
		wget -O osu035_stdcells.v.part https://vlsiarch.ecen.okstate.edu/flows/MOSIS_SCMOS/latest/cadence/lib/ami035/signalstorm/osu035_stdcells.v
		mv osu035_stdcells.v.part osu035_stdcells.v

clean: 
		rm -f osu035_stdcells.lib
		rm -f osu035_stdcells.v

