#!/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/openvlsi/anais/hola
#-------------------------------------------

# /usr/local/share/qflow/scripts/synthesize.sh /home/openvlsi/anais/hola mips /home/openvlsi/anais/hola/source/mips.v || exit 1
# /usr/local/share/qflow/scripts/placement.sh -d /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/opentimer.sh  /home/openvlsi/anais/hola mips || exit 1
/usr/local/share/qflow/scripts/vesta.sh -a /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/router.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/opentimer.sh  -d /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/vesta.sh -a -d /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/migrate.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/drc.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/lvs.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/gdsii.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/cleanup.sh /home/openvlsi/anais/hola mips || exit 1
# /usr/local/share/qflow/scripts/display.sh /home/openvlsi/anais/hola mips || exit 1
