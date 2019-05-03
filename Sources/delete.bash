#!/bin/bash
#Delete Contact functionality
source ./input_checker.bash
AddBook=addbook.txt
while true; do
	FLAG=0
	echo "-------------------------------------------------------"
	echo "******************** DELETE CONTACTS ******************"
	echo "-------------------------------------------------------"
	echo -e "\n[1] Delete all contacts"
	echo "[2] Delete specific contact"
	echo "[B] Return to main menu"
	while true; do
		echo -ne "\nInput option: "
		read OPTION
		case "$OPTION" in
			1)
				clear	
				if [ -s "$AddBook" ]; then
					while true; do
       	                                	echo -ne "\nDo you want to delete all contacts (Y/N): "
                                        	read CHOICE
                                        	if [[ $CHOICE = [Yy] ]]; then
							> $AddBook
							echo "All contacts has been deleted!"
							echo "RESULT: All contacts has been deleted! - DELETE $(date)" >> logs.txt
							break 2
						elif [[ $CHOICE = [Nn] ]]; then
                                                	echo "Contacts not deleted!"
                                                	echo "RESULT: Contacts not deleted! - `grep -w "$CONT" $AddBook` - DELETE $(date)" >> logs.txt
                                                	break 2
                                        	else
                                                	echo "Invalid input!"
                                        	fi
                                	done
				else
					echo "Address Book is empty!"
					break
				fi
				;;
			2)
				clear
				if [ -s "$AddBook" ]; then
					while true; do
						echo -e "Fill the following information"	
						while true; do
							ERROR=0
							echo -ne "\nFirst Name: "
							read FNAME
							FN="First Name"
							invalid "$FNAME" "$FN" "DELETE"
							null "$FNAME" "$FN" "DELETE"
							if [ "$ERROR" -eq 0 ]; then
								break
							fi
						done
						while true; do
							ERROR=0
							echo -ne "\nMiddle Name: "
							read MNAME
							MN="Middle Name"
							invalid "$MNAME" "$MN" "DELETE"
							null "$MNAME" "$MN" "DELETE"
							if [ "$ERROR" -eq 0 ]; then
								break
							fi
						done
						while true; do
							ERROR=0
							echo -ne "\nLast Name: "
							read LNAME
							LN="Last Name"
							invalid "$LNAME" "$LN" "DELETE"
							null "$LNAME" "$LN" "DELETE"
							if [ "$ERROR" -eq 0 ]; then
								break
							fi
						done
						CONT=$(echo $FNAME:$MNAME:$LNAME)
						grep -wq "$CONT" $AddBook
						if [ $? -ne 0 ]; then
							echo -e "\nContact not existing!"
							echo "ERROR: Contact not existing! - INPUT: $CONT - DELETE $(date)" >> logs.txt
						else
							clear
							echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" >> tmp.txt
							grep -w "$CONT" $AddBook >> tmp.txt	
							column tmp.txt -t -s ":"
					                rm tmp.txt
							while true; do
								echo -ne "\nDo you want to delete the contact (Y/N): "
								read CHOICE
								if [[ $CHOICE = [Yy] ]]; then
									sed "/$CONT/d" $AddBook > tmp.txt && mv tmp.txt $AddBook 
									echo "Contact has been deleted!"
									echo "RESULT: Contact has been deleted! - `grep -w "$CONT" $AddBook` - DELETE $(date)" >> logs.txt
									break 
								elif [[ $CHOICE = [Nn] ]]; then
									echo "Contact not deleted!"
									echo "RESULT: Contact not deleted! - `grep -w "$CONT" $AddBook` - DELETE $(date)" >> logs.txt
									break 
								else
									echo "Invalid input!"
								fi
							done
						fi
						while true; do
				                	echo -ne "\nDelete contacts again? (Y/N): "
                					read RET
                					if [[ $RET = [Nn] ]]; then
                       		 				break 4 
                					elif [[ $RET = [Yy] ]]; then
                       		 				clear
                       		 				break
                					else
                       		 				echo "Invalid input!"
                					fi
        					done
					done
				else
					echo "Address Book is empty!"
					break
				fi
				;;
			[Bb])
				break 2
				;;
			*)
				echo "Invalid input!"
				;;
		esac
	done
	while true; do
		echo -ne "\nReturn to Delete Contacts menu (Bb): "
		read RET
		if [[ $RET != [Bb] ]]; then
			echo "Invalid input!"
		else
			break	
		fi
	done
	clear
done
clear 
exit 0
