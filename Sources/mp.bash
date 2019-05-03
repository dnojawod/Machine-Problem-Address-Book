#!/bin/bash
#Functionalities of the address book
clear
while true; do
	echo "-------------------------------------------------------"
	echo "************** WELCOME TO VP ENTERPRISES **************"
	echo "-------------------------------------------------------"
	echo -e "\n~~~~~ OPTIONS ~~~~~\n"
	echo "[1] Add Contact"
	echo "[2] Edit Contact"
	echo "[3] Delete Contact"
	echo "[4] View Contacts"
	echo "[5] Load Contacts"
	echo "[6] Logs"
	echo "[x] Exit"
	echo -ne "\nInput option: "
	read OPTION
	
	case "$OPTION" in
		1)
			clear
			add.bash
			;;
		2) 
			clear
			edit.bash
			;;
		3)
			clear
			delete.bash
			;;
		4)
			clear
			view.bash
			;;
		5)
			clear
			batch.bash
			;;
		6)
			clear
			logs.bash
			;;
		[xX])
			clear
			echo "Terminating program..."
			echo "THANK YOU FOR USING OUR PROGRAM!"
			echo "GOODBYE!"
			break
			;;
		*)
			clear
			echo "Invalid input!"
			;;
	esac
done
exit 0	
