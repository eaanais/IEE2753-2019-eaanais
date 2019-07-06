#!/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes
#-------------------------------------------

# /usr/local/share/qflow/scripts/synthesize.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes/source/FIR.v || exit 1
# /usr/local/share/qflow/scripts/placement.sh -d /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/opentimer.sh  /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/vesta.sh -a /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/router.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/opentimer.sh  -d /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/vesta.sh -a -d /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/migrate.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
/usr/local/share/qflow/scripts/drc.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/lvs.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/gdsii.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/cleanup.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
# /usr/local/share/qflow/scripts/display.sh /home/openvlsi/proyecto/IEE2753-2019-eaanais/proyecto/qflow_viernes FIR || exit 1
