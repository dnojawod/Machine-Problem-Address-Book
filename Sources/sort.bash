#!/bin/bash
#Sort Contacts Functionality

AddBook=addbook.txt
SORT ()  {
	cat $AddBook | cut -f$1 -d":" > tmp.txt
	readarray CONT < addbook.txt	
	readarray SORT < tmp.txt	
	VAR=$(cat tmp.txt)
	COUNT=$(cat $AddBook | wc -l)
	for ((i=0;i<$COUNT;i++)); do
		for ((j=i;j<$COUNT;j++)); do
			FIELD=1
			if [[ `echo ${SORT[$i]} | grep " "` && `echo ${SORT[$j]} | grep " "` ]]; then
			while [[ -n `echo ${SORT[$i]} | cut -f$FIELD -d" "` || -n `echo ${SORT[$j]} | cut -f$FIELD -d" "` ]]; do 
				if [[ `echo ${SORT[$i]} | cut -f$FIELD -d" "` > `echo ${SORT[$j]} | cut -f$FIELD -d" "` ]]; then
					temp=${SORT[$i]}
	                                SORT[$i]=${SORT[$j]}
        	                        SORT[$j]=$temp
                                	temp1=${CONT[$i]}
                                	CONT[$i]=${CONT[$j]}
                                	CONT[$j]=$temp1
					break
				elif [[ `echo ${SORT[$i]} | cut -f$FIELD -d" "` < `echo ${SORT[$j]} | cut -f$FIELD -d" "` ]]; then
                                      	break
				fi 
				(( FIELD++ ))
			done
			elif [[ `echo ${SORT[$i]} | grep " "` ]]; then
				if [[ `echo ${SORT[$i]} | cut -f1 -d" "` > `echo ${SORT[$j]} | cut -f1 -d" "` || `echo ${SORT[$i]} | cut -f1 -d" "` = `echo ${SORT[$j]} | cut -f1 -d" "` ]]; then
					temp=${SORT[$i]}
                                        SORT[$i]=${SORT[$j]}
                                        SORT[$j]=$temp
                                        temp1=${CONT[$i]}
                                        CONT[$i]=${CONT[$j]}
                                        CONT[$j]=$temp1
                                fi
			elif [[ `echo ${SORT[$j]} | grep " "` ]]; then
				if [[ `echo ${SORT[$i]} | cut -f1 -d" "` > `echo ${SORT[$j]} | cut -f1 -d" "` ]]; then
                                        temp=${SORT[$i]}
                                        SORT[$i]=${SORT[$j]}
                                        SORT[$j]=$temp
                                        temp1=${CONT[$i]}
                                        CONT[$i]=${CONT[$j]}
                                        CONT[$j]=$temp1
                                fi
			elif [[ ${SORT[$i]} > ${SORT[$j]} ]]; then
				temp=${SORT[$i]}
				SORT[$i]=${SORT[$j]}
				SORT[$j]=$temp
				temp1=${CONT[$i]}
				CONT[$i]=${CONT[$j]}
				CONT[$j]=$temp1
			fi
		done
	done
	echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" > tmp.txt
	for ((i=0;i<$COUNT;i++)); do
		echo ${CONT[$i]} >> tmp.txt 
	done
	column tmp.txt -t -s ":"
	rm tmp.txt
	echo -e "\nContacts successfully sorted by $2!"
        echo "RESULT: Contacts successfully sorted! - VIEW(SORT) $(date)" >> logs.txt
}
SORT_BDAY () {
	cat $AddBook | cut -f$1 -d":" > tmp.txt
	readarray CONT < $AddBook 
        readarray SORT < tmp.txt
        COUNT=$(cat $AddBook | wc -l)
        for ((i=0;i<$COUNT;i++)); do
                for ((j=i;j<$COUNT;j++)); do
                      	if [[ ${SORT[$i]:6:4} = ${SORT[$j]:6:4} ]]; then
				if [[ ${SORT[$i]:0:2} = ${SORT[$j]:0:2} ]]; then
					if [[ ${SORT[$i]:3:2} > ${SORT[$j]:3:2} ]]; then
                                		temp=${SORT[$i]}
                               			SORT[$i]=${SORT[$j]}
                                		SORT[$j]=$temp
                                		temp1=${CONT[$i]}
                                		CONT[$i]=${CONT[$j]}
                                		CONT[$j]=$temp1
					fi
				elif [[ ${SORT[$i]:0:2} > ${SORT[$j]:0:2} ]]; then	
					temp=${SORT[$i]}
                                	SORT[$i]=${SORT[$j]}
                                	SORT[$j]=$temp
                                	temp1=${CONT[$i]}
                                	CONT[$i]=${CONT[$j]}
                                	CONT[$j]=$temp1
				fi
			elif [[ ${SORT[$i]:6:4} > ${SORT[$j]:6:4} ]]; then
				temp=${SORT[$i]}
                                SORT[$i]=${SORT[$j]}
                                SORT[$j]=$temp
                                temp1=${CONT[$i]}
                                CONT[$i]=${CONT[$j]}
                                CONT[$j]=$temp1
			fi
                done
        done
        echo "First Name:Middle Name:Last Name:Gender:Birth Date:Mobile Number:Nationality:Birth Place:Address" > tmp.txt
        for ((i=0;i<$COUNT;i++)); do
                echo ${CONT[$i]} >> tmp.txt
        done
        column tmp.txt -t -s ":"
        rm tmp.txt
	echo -e "\nContacts successfully sorted by $2!"
	echo "RESULT: Contacts successfully sorted! - VIEW(SORT) $(date)" >> logs.txt 
}	
	
while true; do
        echo "-------------------------------------------------------"
        echo "******************** SORT CONTACTS ********************"
        echo "-------------------------------------------------------"
        echo -e "\nChoose a field to sort"
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
				SORT 1 "First Name"
				break
				;;
			2)
				clear
				SORT 2 "Middle Name" 
				break
                       		;;
			3)
				clear 
				SORT 3 "Last Name" 
				break
                        	;;
			4)
				clear
				SORT 4 "Gender" 
				break
                        	;;
			5)
				clear
				SORT_BDAY 5 "Birth Date" 
				break	
                        	;;
			6)
				clear
				SORT 6 "Mobile Number" 
				break
                        	;;
			7)
				clear
				SORT 7 "Nationality" 
				break
                        	;;
			8)
				clear
				SORT 8 "Birth Place" 
				break
                        	;;
			9)
				clear
				SORT 9 "Address" 
				break
                        	;;
			[Bb])
				break 2
				;;
			*)
				echo "Invalid field!"
				echo "ERROR: Invalid field! - INPUT: $OPTION - VIEW(SORT) $(date)" >> logs.txt
				;;
		esac
	done
	while true; do
		echo -ne "\nSort contacts again? (Y/N): "
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
