
synth.v: flow.ys example.constr osu05_stdcells.lib osu05_stdcells.v
		yosys -l flow.log flow.ys

osu05_stdcells.lib:
		rm -f osu05_stdcells.lib.part osu05_stdcells.lib
		wget -O osu05_stdcells.lib.part https://vlsiarch.ecen.okstate.edu/flows/MOSIS_SCMOS/latest/cadence/lib/ami05/signalstorm/osu05_stdcells.lib	
		mv osu05_stdcells.lib.part osu05_stdcells.lib

osu05_stdcells.v:
		rm -f osu05_stdcells.v.part osu05_stdcells.v
		wget -O osu05_stdcells.v.part https://vlsiarch.ecen.okstate.edu/flows/MOSIS_SCMOS/latest/cadence/lib/ami05/signalstorm/osu05_stdcells.v
		mv osu05_stdcells.v.part osu05_stdcells.v

clean: 
		rm -f osu05_stdcells.lib
		rm -f osu05_stdcells.v

