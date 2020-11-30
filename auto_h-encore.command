#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${DIR}"
clear


echo "#######################################################"
echo "[ Welcome to automatic Henkaku installer from Mac OSX ]"
echo "#######################################################"
echo ""
echo "--"
echo "Source proyect: https://github.com/mfruizs/mac_psvita_hack365"
echo "Developer: mfruizs - https://github.com/mfruizs"
echo "Origin Creator: unrealSWAT (Reddit)"
echo "--"
echo ""
echo "/!\ Follow this instructions to hack PsVita 3.65 version /!\\"
echo ""

read -p "Press [Enter] key to continue..."
clear

download_demo_game()
{
	# exists demo game

	FILE=./xGMrXOkORxWRyqzLMihZPqsXAbAXLzvAdJFqtPJLAZTgOcqJobxQAhLNbgiFydVlcmVOrpZKklOYxizQCRpiLfjeROuWivGXfwgkq.pkg
	if [ -f "$FILE" ]; then
	    echo "Demo Bitter Smile exists on root"
	else
	    echo "Bitter Smile game does not exist on root"
	    echo "downloading from web store... please wait"
	    wget http://ares.dl.playstation.net/cdn/JP0741/PCSG90096_00/xGMrXOkORxWRyqzLMihZPqsXAbAXLzvAdJFqtPJLAZTgOcqJobxQAhLNbgiFydVlcmVOrpZKklOYxizQCRpiLfjeROuWivGXfwgkq.pkg
	fi
	echo ""
}

install_henkaku()
{

	# download demo game

	if [ "$1" = true ] ; then
	    download_demo_game
	fi

	# recover data from promt

	read -p "Enter QCMA installationg complete path : " qcmapath
	qcmapath="$qcmapath/APP"

	echo ""
	dirpath=`ls -l "$qcmapath" | cut -d " " -f12`

	# Select PSN ID from qcma folder structure

	printf "Please select your PSN ID:\n"
	select d in $dirpath;
	do
		echo "PSN ID Selected: " $d
		qcmaid=$d
		break;
	done

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

	cp -r PCSG90096/ "$qcmapath/$qcmaid/PCSG90096/"

	# end

	kill -HUP $(pgrep qcma)
}


print_header_menu()
{

	echo "#######################################################"
	echo "[     Automatic Henkaku installer from Mac OSX        ]"
	echo "#######################################################"
	echo ""
	echo 'Please select your choice: '
	echo ""
}


# HEAD MENU
print_header_menu
options=("Quit" "Complete Henkaku install" "Only download Demo (Hack)" "Only install Henkaku"   )

select opt in "${options[@]}"
do
    case $opt in
	 	"Quit")
			clear
            break
            ;;
        "Complete Henkaku install")
			install_henkaku true
			read -p "Press [Enter] key to continue..."
			clear
			print_header_menu
			;;
     	"Only download Demo (Hack)")
			echo "validating files on root..."
			download_demo_game
			read -p "Press [Enter] key to continue..."
			clear
			print_header_menu
            ;;
     	"Only install Henkaku")
			install_henkaku false
			read -p "Press [Enter] key to continue..."
			clear
			print_header_menu
			;;
  		*) 	echo "invalid option $REPLY"
			read -p "Press [Enter] key to continue..."
			clear
			print_header_menu
			;;

    esac
done
