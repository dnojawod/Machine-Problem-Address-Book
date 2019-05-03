#!/bin/bash
#Logs functionality
LOG=$(cat logs.txt)
clear
echo "-------------------------------------------------------"
echo "********************* LOG FILES ***********************"
echo "-------------------------------------------------------"
echo -e "\n$LOG"
while true; do
	echo -ne "\nReturn to main menu (Bb): "
	read RET
	if [[ $RET != [Bb] ]]; then
		echo "Invalid input!"
	else
		break
	fi
done
clear	
exit 0

