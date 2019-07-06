mkdir source synthesis layout
wget http://opencircuitdesign.com/qflow/example/map9v3.v
mv map9v3.v ./source
wget http://opencircuitdesign.com/qflow/example/load.tcl
mv load.tcl ./layout
qflow synthesize place route map9v3
if ( -f ../libs/osu_stdcells) then
	source ../libs/get_osu_libs.csh
endif
cd layout

magic -dnull -noconsole << EOF
source ../read_map9v3.tcl
EOF
mkdir digital
cp .magicrc digital
cd digital
magic -dnull -noconsole << EOF
gds read ../../../libs/osu_stdcells/lib/source/gds2/osu035_stdcells.gds2 
writeall force 
quit -noprompt
EOF
cd ../
#label vdd n m1
#label gnd n m1
#writeall force map9v3
#extract all 
#ext2spice hierarchy on 
#ext2spice scale off 
#ext2spice renumber off 
#ext2spice cthresh infinite 
#ext2spice rthresh infinite 
#ext2spice
#ext2sim
 

