#!/bin/bash
#Search Contacts Functionality
source ./input_checker.bash
AddBook=addbook.txt
while true; do
        echo "-------------------------------------------------------"
        echo "******************** SEARCH CONTACTS ******************"
        echo "-------------------------------------------------------"
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
        echo "[B] Return to View Contacts menu"
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
                                invalid "$FNAME" "$FN" "VIEW(SEARCH)"
                                null "$FNAME" "$FN" "VIEW(SEARCH)"
				if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$FNAME" '($1 == var)' $AddBook >> check.txt
			if [ ! -s check.txt ]; then

				echo "Contact not existing!"
				echo "ERROR: Contact not existing! - INPUT: $FNAME - VIEW(SEARCH) $(date)" >> logs.txt
			else
                		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
				awk -F ":" -v var="$FNAME" '($1 == var)' $AddBook >> tmp.txt
               			column tmp.txt -t -s ":"
				rm tmp.txt
			fi
			rm check.txt
			SEARCH=$(echo $FN $FNAME)
			break
			;;
		2)
			clear
                        while true; do
                                ERROR=0
                                echo -ne "\nMiddle Name: "
                                read MNAME
                                MN="Middle Name"
                                invalid "$MNAME" "$MN" "VIEW(SEARCH)"
                                null "$MNAME" "$MN" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$MNAME" '($2 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $MNAME - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
				awk -F ":" -v var="$MNAME" '($2 == var)' $AddBook >> tmp.txt
                		column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt	
			SEARCH=$(echo $MN $MNAME)
			break
			;;
		3)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nLast Name: "
                                read LNAME
                                LN="Last Name"
                                invalid "$LNAME" "$LN" "VIEW(SEARCH)"
                                null "$LNAME" "$LN" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then	
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$LNAME" '($3 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $LNAME - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
				awk -F ":" -v var="$LNAME" '($3 == var)' $AddBook >> tmp.txt
                		column tmp.txt -t -s ":"
				rm tmp.txt
			fi
			rm check.txt
			SEARCH=$(echo $LN $LNAME)
			break
                        ;;
		4)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nGender (F/M): "
                                read GENDER
                                GD="Gender"
                                gender "$GENDER" "$GD" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$GENDER" '($4 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $GENDER - VIEW(SEARCH)$(date)" >> logs.txt
                        else
                		echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                		awk -F ":" -v var="$GENDER" '($4 == var)' $AddBook >> tmp.txt
                		column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $GD $GENDER)
			break
                        ;;	
		5)
			clear
                        while true; do
                                ERROR=0
                                echo -ne "\nBirth Date (MM/DD/YYYY): "
                                read BDATE
                                BD="Birth Date"
                                bdate "$BDATE" "$BD" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
					break	
                               	fi
                        done
			clear
			awk -F ":" -v var="$BDATE" '($5 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $BDATE - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                                echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                                awk -F ":" -v var="$BDATE" '($5 == var)' $AddBook >> tmp.txt
                                column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $BD $BDATE)
			break
                        ;;
		6)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nMobile Number (XXXXXXXXXXX): "
                                read NUM
                                MN="Mobile Number"
                                num "$NUM" "$MN" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
					break
                                fi
                        done
			clear
			awk -F ":" -v var="$NUM" '($6 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $NUM - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                                echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                                awk -F ":" -v var="$NUM" '($6 == var)' $AddBook >> tmp.txt
                                column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $MN $NUM)
			break
                        ;;
		7)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nNationality: "
                                read NAT
              		        NT="Nationality"
                                invalid "$NAT" "$NT" "VIEW(SEARCH)"
                                null "$NAT" "$NT" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$NAT" '($7 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $NAT - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                                echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                                awk -F ":" -v var="$NAT" '($7 == var)' $AddBook >> tmp.txt
                                column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $NT $NAT)
			break
                        ;;
		8)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nBirth Place: "
                                read BPLACE
                                BP="Birth Place"
                                null "$BPLACE" "$BP" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$BPLACE" '($8 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $BPLACE - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                                echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                                awk -F ":" -v var="$BPLACE" '($8 == var)' $AddBook >> tmp.txt
                                column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $BP $BPLACE)
			break
                        ;;
		9)
			clear
			while true; do
                                ERROR=0
                                echo -ne "\nAddress: "
                                read ADDRESS
                                AD="Address"
                                null "$ADDRESS" "$AD" "VIEW(SEARCH)"
                                if [ "$ERROR" -eq 0 ]; then
                                        break
                                fi
                        done
			clear
			awk -F ":" -v var="$ADDRESS" '($9 == var)' $AddBook >> check.txt
                        if [ ! -s check.txt ]; then
                                echo "Contact not existing!"
                                echo "ERROR: Contact not existing! - INPUT: $ADDRESS - VIEW(SEARCH) $(date)" >> logs.txt
                        else
                                echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
                                awk -F ":" -v var="$ADDRESS" '($9 == var)' $AddBook >> tmp.txt
                                column tmp.txt -t -s ":"
				rm tmp.txt
                        fi
			rm check.txt
			SEARCH=$(echo $AD $ADDRESS)
			break
                        ;;
		[Bb])
			break 2
			;;
		*)
			echo "Invalid field!"
                        echo "ERROR: Invalid field! - INPUT: $OPTION - VIEW(SEARCH) $(date)" >> logs.txt
			;;
	esac
	done
	echo -e "\nContacts searched by $SEARCH!"
	echo "RESULT: Contacts searched by $SEARCH! - INPUT: $SEARCH - VIEW(SEARCH) $(date)" >> logs.txt
	while true; do
                echo -ne "\nSearch contacts again? (Y/N): "
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
