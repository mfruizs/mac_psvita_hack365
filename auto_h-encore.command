#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${DIR}"

# recover data from promt
read -p "Enter QCMA installationg complete path : " qcmapath
read -p "Enter your [ PSN ID ] : " qcmaid

# create encrypted key from Henkaku website
aid=`curl -X GET "http://cma.henkaku.xyz/?aid=$qcmaid" | tail -1f | cut -d ' ' -f 2`

# generate henkaku codehack
./pkg2zip -x xGMrXOkORxWRyqzLMihZPqsXAbAXLzvAdJFqtPJLAZTgOcqJobxQAhLNbgiFydVlcmVOrpZKklOYxizQCRpiLfjeROuWivGXfwgkq.pkg
cp -r app/PCSG90096/ app/ux0_temp_game_PCSG90096_app_PCSG90096/
cp app/PCSG90096/sce_sys/package/temp.bin license/ux0_temp_game_PCSG90096_license_app_PCSG90096/6488b73b912a753a492e2714e9b38bc7.rif

./psvimgtools/psvimg-create -n app -K $aid app PCSG90096/app
./psvimgtools/psvimg-create -n appmeta -K $aid appmeta PCSG90096/appmeta
./psvimgtools/psvimg-create -n license -K $aid license PCSG90096/license
./psvimgtools/psvimg-create -n savedata -K $aid savedata PCSG90096/savedata

# save to correct directory
cp -r PCSG90096/ "$qcmapath/APP/$qcmaid/PCSG90096/"

# end
kill -HUP $(pgrep qcma)