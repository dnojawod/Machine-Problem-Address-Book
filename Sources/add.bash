#!/bin/bash
AddBook="addbook.txt"
source ./input_checker.bash
#Add Contact functionality
while true; do
	echo "-------------------------------------------------------"
	echo "**************** ENTER CONTACT DETAILS ****************"
	echo "-------------------------------------------------------"
	echo -e "\nFill the following information"
	while true; do
		ERROR=0
		echo -ne "\nFirst Name: "
		read FNAME
		FN="First Name"	
		null "$FNAME" "$FN" "ADD"
		invalid "$FNAME" "$FN" "ADD"
		if [[ $ERROR -eq 0 ]]; then	
			break
		fi
	done
	
	while true; do
		ERROR=0
		echo -ne "\nMiddle Name: "
		read MNAME
		MN="Middle Name"
		null "$MNAME" "$MN" "ADD"   
                invalid "$MNAME" "$MN" "ADD"
		if [ $ERROR -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0
		echo -ne "\nLast Name: "
		read LNAME
		LN="Last Name"
		null "$LNAME" "$LN" "ADD"   
                invalid "$LNAME" "$LN" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0	
		echo -ne "\nGender (F/M): "
		read GENDER
		GD="Gender"
		gender "$GENDER" "$GD" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0
		echo -ne "\nBirth Date (MM/DD/YYYY): "
		read BDATE
		BD="Birth Date"
		bdate "$BDATE" "$BD" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0
		echo -ne "\nMobile Number (XXXXXXXXXXX): "
		read NUM
		MN="Mobile Number"
		num "$NUM" "$MN" "ADD"
		if [ "$ERROR" -eq 0 ]; then 
			break
		fi
	done
	
	while true; do
		ERROR=0
		echo -ne "\nNationality: "
		read NAT
		NT="Nationality"
		null "$NAT" "$NT" "ADD"   
                invalid "$NAT" "$NT" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0
		echo -ne "\nBirth Place: "
		read BPLACE
		BP="Birth Place"
		null "$BPLACE" "$BP" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done

	while true; do
		ERROR=0
		echo -ne "\nAddress: "
		read ADDRESS
		AD="Address"
		null "$ADDRESS" "$AD" "ADD"
		if [ "$ERROR" -eq 0 ]; then
			break
		fi
	done
	clear
	echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
        echo $FNAME:$MNAME:$LNAME:$GENDER:$BDATE:$NUM:$NAT:$BPLACE:$ADDRESS >> tmp.txt
        column tmp.txt -t -s ":"
        rm tmp.txt
	CONTACT=$(echo $FNAME:$MNAME:$LNAME)
        grep -wq "^$CONTACT$" $AddBook
	if [ "$?" -eq 0 ]; then
		echo -e "\nContact already existing!"
		echo "ERROR: Contact already existing! - INPUT: $CONTACT - ADD $(date)" >> logs.txt
	else
		echo $FNAME:$MNAME:$LNAME:$GENDER:$BDATE:$NUM:$NAT:$BPLACE:$ADDRESS >> $AddBook
		echo -e "\nNew contact has been successfully added to address book!"
		echo "RESULT: New contact has been successfully added to address book! - INPUT: echo $FNAME:$MNAME:$LNAME:$GENDER:$BDATE:$NUM:$NAT:$BPLACE:$ADDRESS - ADD $(date)" >> logs.txt
	fi
	while true; do
		echo -ne "\nDo you want to add again? (Y/N): "
		read RET
		if [[ $RET = [Yy] ]]; then
			clear
			break
		elif [[ $RET = [Nn] ]]; then
			break 2
		else
			echo "Invalid input!"
		fi
	done
done
clear
exit 0
