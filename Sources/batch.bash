#!/bin/bash
#Load Contacts via batch file functionality
source ./input_checker.bash
AddBook=addbook.txt
while true; do
	FLAG=0	
	echo "-------------------------------------------------------"
	echo "******************** LOAD CONTACTS ********************"
	echo "-------------------------------------------------------"
	echo -ne "\nInput batch file location (absolute path): "
	read LOC
	if  [ -e $LOC ]; then
		clear
		while read file; do
			FIELD=$(echo "$file" | tr ":" "\n" | wc -l)
			if [ $FIELD -ne 9 ]; then
				echo "Some contacts doesn't meet required fields!"
				echo "ERROR: Some contacts doesn't meet required fields! - INPUT: $file - LOAD $(date)" >> logs.txt
				
			fi
		done < $LOC 
		VALID=0
		while read file; do
			ERROR=0
			FNAME=$(echo "$file" | cut -f1 -d":")
                        MNAME=$(echo "$file" | cut -f2 -d":")
                        LNAME=$(echo "$file" | cut -f3 -d":")
			CONT=$(echo $FNAME:$MNAME:$LNAME)
			grep -wq "$CONT" $AddBook 
			if [ $? -eq 0 ]; then
				echo "Contact $FNAME $MNAME $LNAME already existing!"
				echo "ERROR: Contact $FNAME $MNAME $LNAME already existing! - $file - LOAD $(date)" >> logs.txt 
				continue
			fi	
				FNAME=$(echo "$file" | cut -f1 -d":")
				MNAME=$(echo "$file" | cut -f2 -d":")
				LNAME=$(echo "$file" | cut -f3 -d":")
				GENDER=$(echo "$file" | cut -f4 -d":")
				BDATE=$(echo "$file" | cut -f5 -d":")
				NUM=$(echo "$file" | cut -f6 -d":")
				NAT=$(echo "$file" | cut -f7 -d":")
				BPLACE=$(echo "$file" | cut -f8 -d":")
				ADDRESS=$(echo "$file" | cut -f9 -d":")

				FN="First Name of $FNAME $MNAME $LNAME"
                                invalid "$FNAME" "$FN" "LOAD"
                                null "$FNAME" "$FN" "LOAD"
				MN="Middle Name of $FNAME $MNAME $LNAME"
                                invalid "$MNAME" "$MN" "LOAD"
                                null "$MNAME" "$MN" "LOAD"
				LN="Last Name of $FNAME $MNAME $LNAME"
                                invalid "$LNAME" "$LN" "LOAD"
                                null "$LNAME" "$LN" "LOAD"
				GD="Gender of $FNAME $MNAME $LNAME"
                                gender "$GENDER" "$GD" "LOAD"
				BD="Birth Date of $FNAME $MNAME $LNAME"
                                bdate "$BDATE" "$BD" "LOAD"
				MN="Mobile Number of $FNAME $MNAME $LNAME"
                                num "$NUM" "$MN" "LOAD"
				NT="Nationality of $FNAME $MNAME $LNAME"
                                invalid "$NAT" "$NT" "LOAD"
                                null "$NAT" "$NT" "LOAD"
				BP="Birth Place of $FNAME $MNAME $LNAME"
                                null "$BPLACE" "$BP" "LOAD"
				AD="Address of $FNAME $MNAME $LNAME"
                                null "$ADDRESS" "$AD" "LOAD"	
				if [ "$ERROR" -eq 0 ]; then
					echo "$file" >> $AddBook
					VALID=1
				fi	
		done < $LOC
		if [ "$VALID" -eq 1 ]; then
			echo -e "\nValid contacts from batch file have been loaded!"
			echo "RESULT: Valid contacts from batch file have been loaded! - LOAD $(date)" >> logs.txt 
		else
			echo -e "\nNo valid contacts from batch file have been loaded!"
			echo "RESULT: No valid contacts from batch file have been loaded! - LOAD $(date)" >> logs.txt
		fi
	else
		echo "Batch file does not exist!"
		echo "ERROR: Batch file does not exist! - INPUT: $LOC - LOAD $(date)" >> logs.txt
	fi
	while true; do
		echo -ne "\nLoad another batch file? (Y/N): "
		read RET
		if [[ $RET = [Yy] ]]; then
			break
		elif [[ $RET = [Nn] ]]; then
			break 2
		else
			echo "Invalid input!"
		fi
	done
	clear
done
clear
exit 0
