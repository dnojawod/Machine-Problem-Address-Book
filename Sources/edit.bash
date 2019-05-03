#!/bin/bash
#Edit Contacts Functionality
source ./input_checker.bash 
AddBook=addbook.txt
while true; do
	echo "-------------------------------------------------------"
	echo "******************** EDIT CONTACTS ********************"
	echo "-------------------------------------------------------"
	echo -e "\nFill the following information"
	while true; do
		ERROR=0
		echo -ne "\nFirst Name: "
		read FNAME
		FN="First Name"
		invalid "$FNAME" "$FN" "EDIT"
		null "$FNAME" "$FN" "EDIT"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done
	while true; do
		ERROR=0
		echo -ne "\nMiddle Name: "
		read MNAME
		MN="Middle Name"
		invalid "$MNAME" "$MN" "EDIT"
		null "$MNAME" "$MN" "EDIT"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done
	while true; do
		ERROR=0
		echo -ne "\nLast Name: "
		read LNAME
		LN="Last Name"
		invalid "$LNAME" "$LN" "EDIT"
		null "$LNAME" "$LN" "EDIT"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done
	OLDCONT=$(echo $FNAME:$MNAME:$LNAME)
	grep -wq "$OLDCONT" $AddBook
	if [ $? -ne 0 ]; then
		echo -e "\nContact not existing!"
		echo "ERROR: Contact not existing! - INPUT: $OLDCONT -  EDIT $(date)" >> logs.txt
	else
		clear
		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
		grep -w "$OLDCONT" $AddBook >> tmp.txt
		column tmp.txt -t -s ":"
		rm tmp.txt
		GENDER=$(grep -w "$OLDCONT" $AddBook | cut -f4 -d":")
		BDATE=$(grep -w "$OLDCONT" $AddBook | cut -f5 -d":")
		NUM=$(grep -w "$OLDCONT" $AddBook | cut -f6 -d":")
		NAT=$(grep -w "$OLDCONT" $AddBook | cut -f7 -d":")
		BPLACE=$(grep -w "$OLDCONT" $AddBook | cut -f8 -d":")
		ADDRESS=$(grep -w "$OLDCONT" $AddBook | cut -f9 -d":")	
		echo -e "\nChoose a field to edit"
		echo "[1] First Name"
		echo "[2] Middle Name"
		echo "[3] Last Name"
		echo "[4] Gender"
		echo "[5] Birth Date"
		echo "[6] Mobile Number"
		echo "[7] Nationality"
		echo "[8] Birth Place"
		echo "[9] Address"
		echo "[B] Return to main menu"
		while true; do	
			echo -ne "\nInput option: "
			read OPTION
			case "$OPTION" in
				1)
					clear
					while true; do
						ERROR=0
						echo -ne "\nFirst Name: "
						read FNAME
						FN="First Name"
						invalid "$FNAME" "$FN" "EDIT"
						null "$FNAME" "$FN" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$FN
					break
					;;
				2)
					clear
					while true; do
						ERROR=0
						echo -ne "\nMiddle Name: "
						read MNAME
						MN="Middle Name"
						invalid "$MNAME" "$MN" "EDIT"
						null "$MNAME" "$MN" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$MN
					break
					;;
				3)
					clear
					while true; do
						ERROR=0
						echo -ne "\nLast Name: "
						read LNAME
						LN="Last Name"
						invalid "$LNAME" "$LN" "EDIT"
						null "$LNAME" "$LN" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$LN
					break
					;;
				4)
					clear
					while true; do
						ERROR=0
						echo -ne "\nGender (F/M): "
						read GENDER
						GD="Gender"
						gender "$GENDER" "$GD" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$GD
					break
					;;
				5)
					clear
					while true; do
						ERROR=0
						echo -ne "\nBirth Date (MM/DD/YYYY): "
						read BDATE
						BD="Birth Date"
						bdate "$BDATE" "$BD" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$BD
					break
					;;
				6)
					clear
					while true; do
						ERROR=0
						echo -ne "\nMobile Number (XXXXXXXXXXX): "
						read NUM
						MN="Mobile Number"
						num "$NUM" "$MN" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$MN
					break
					;;
				7)
					clear
					while true; do
						ERROR=0
						echo -ne "\nNationality: "
						read NAT
						NT="Nationality"
						invalid "$NAT" "$NT" "EDIT"
						null "$NAT" "$NT" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$NT
					break
					;;
				8)
					clear
					while true; do
						ERROR=0
						echo -ne "\nBirth Place: "
						read BPLACE
						BP="Birth Place"
						null "$BPLACE" "$BP" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$BP
					break
					;;
				9)
					clear
					while true; do
						ERROR=0
						echo -ne "\nAddress: "
						read ADDRESS
						AD="Address"
						null "$ADDRESS" "$AD" "EDIT"
						if [ "$ERROR" -eq 0 ]; then
							break
						fi
					done
					EDIT=$AD
					break
					;;
				[Bb])
					break 2
					;;
				*)
					echo "Invalid field!"
					echo "ERROR: Invalid field! - INPUT: $OPTION - EDIT $(date)" >> logs.txt
					;;
			esac
		done
		clear
		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
        	echo $FNAME:$MNAME:$LNAME:$GENDER:$BDATE:$NUM:$NAT:$BPLACE:$ADDRESS >> tmp.txt
        	column tmp.txt -t -s ":"
        	rm tmp.txt
		CONT=$(echo "$FNAME:$MNAME:$LNAME")
                grep -wq "$CONT" $AddBook
		if [ $? -eq 0 ]; then
			echo -e "\nContact $FNAME $MNAME $LNAME already existing!"
			echo "ERROR: Contact $FNAME $MNAME $LNAME already existing! - grep -w $CONT $AddBook - EDIT $(date)" >> logs.txt
		else
			NEWCONT=$(echo $FNAME:$MNAME:$LNAME:$GENDER:$BDATE:$NUM:$NAT:$BPLACE:$ADDRESS)
			sed "/$OLDCONT/d" $AddBook > tmp.txt && mv tmp.txt $AddBook 
			echo $NEWCONT >> $AddBook	
			echo -e "\n$EDIT of contact successfully edited!"
			echo "RESULT: $EDIT of contact successfully edited! - $NEWCONT - EDIT $(date)" >> logs.txt
		fi
	fi
	while true; do
                echo -ne "\nEdit another contact? (Y/N): "
                read RET
                if [[ $RET = [Nn] ]]; then
                        break 2
                elif [[ $RET = [Yy] ]]; then
                        clear
                        break
                else
                        echo "Invalid input!"
                fi
        done
done
clear
exit 0 
