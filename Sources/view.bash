#!/bin/bash
#View Contact functionality

while true; do
	echo "-------------------------------------------------------"
	echo "******************** VIEW CONTACTS ********************"
	echo "-------------------------------------------------------"
	echo -e "\n[1] Sort Contacts"
	echo "[2] Search Contact"
	echo "[B] Return to main menu"
	while true; do	
		echo -ne "\nInput option: "
		read OPTION
		case "$OPTION" in
			1)
				clear
				sort.bash
				break
				;;
			2)
				clear
				search.bash
				break
				;;
			[Bb])
				break 2
				;;
			*)
				echo "Invalid input!"
				;;
		esac
	done
done
clear
exit 0	
		 
