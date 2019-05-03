#!/bin/bash
#Functions for Input Checking

invalid () {
        if [[ $1 = *[0-9]* || $1 = *[\!@#\$%^\&*()_+]* ]]; then
                echo "Invalid $2! Numbers and special characters not allowed"
                echo "ERROR: Invalid $2! Numbers and special characters not allowed - INPUT: $1 - $3 $(date)" >> logs.txt
                ERROR=1
        fi
}
null () {
        if [[ $1 = " " || ${#1} -eq 0 ]]; then
                echo "$2 is null!"
                echo "ERROR: $2 is null! - INPUT: $1 - $3 $(date)" >> logs.txt
                ERROR=1
        fi
}
gender () {
		GENDER=$1
                GD=$2
                null "$GENDER" "$GD" "$3"
		if [ "$ERROR" -eq 0 ]; then
                        if [[ $GENDER != [FfMm] ]]; then
                                echo "Invalid Gender!"
                                echo "ERROR: Invalid Gender! - INPUT: $GENDER - $3 $(date)" >> logs.txt
                                ERROR=1
                        fi
                fi
}
bdate () {
		BDATE=$1
                BD=$2
                null "$BDATE" "$BD" "$3"
                if [ "$ERROR" -eq 0 ]; then
                        if [[ $BDATE = [0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9] ]]; then
                                MM=$(echo $BDATE | cut -f1 -d"/")
                                DD=$(echo $BDATE | cut -f2 -d"/")
                                YY=$(echo $BDATE | cut -f3 -d"/")
                                if [ "$MM" = "00" -o "$MM" -gt 12 ]; then
                                        echo "Invalid month! Should be between 01-12"
                                        echo "ERROR: Invalid month! Should be between 01-12 - INPUT: $MM - $3 $(date)" >> logs.txt
                                        ERROR=1
                                fi
                                if [ "$MM" = "02" ]; then
                                        if [ "$DD" = "00" -o "$DD" -gt 28 ]; then
                                                echo "Invalid day! Should be between 01-28 for February"
                                                echo "ERROR: Invalid day! Should be between 01-28 for February - INPUT: $DD - $3 $(date)" >> logs.txt
                                                ERROR=1
                                        fi
                                elif [ "$MM" = "01" -o "$MM" = "03" -o "$MM" = "05" -o "$MM" = "07" -o "$MM" = "08" -o "$MM" = "10" -o "$MM" = "12" ]; then
                                        if [ "$DD" = "00" -o "$DD" -gt 31 ]; then
                                                echo "Invalid day! Should be between 01-31"
                                                echo "ERROR: Invalid day! Should be between 01-31 - INPUT: $MM - $3 $(date)" >> logs.txt
                                                ERROR=1
                                        fi
                                else
                                        if [ "$DD" = "00" -o "$DD" -gt 30 ]; then
                                                echo "Invalid day! Should between 01-30"
                                                echo "ERROR: Invalid day! Should between 01-30 - INPUT: $DD - $3 $(date)" >> logs.txt
                                                ERROR=1
                                        fi
                                fi
                                if [ "$YY" = "0000" -o "$YY" -gt $(date +"%Y") ]; then
                                        echo "Invalid year!"
                                        echo "ERROR: Invalid year! - INPUT: $YY - $3 $(date)" >> logs.txt
                                        ERROR=1
                                fi
                        else
                                echo "Invalid format!"
                                echo "ERROR: Invalid format! - INPUT: $BDATE -$3 $(date)" >> logs.txt
				ERROR=1
                       fi
                fi
}
num () {
                NUM=$1
                MN=$2
                null "$NUM" "$MN" "$3"
                if [ "$ERROR" -eq 0 ]; then
                        if [[ $NUM = *[a-Z]* || $NUM = *['!'@#\$%^\&*()_+]* ]]; then
                                echo "Invalid Mobile Number!"
                                echo "ERROR: Invalid Mobile Number! - INPUT: $NUM - $3 $(date)" >> logs.txt
				ERROR=1
                        elif [ "${#NUM}" -ne 11 ]; then
                                echo "Mobile Number should have 11 digits!"
                                echo "Mobile Number should have 11 digits! - INPUT: ${#NUM} - $3 $(date)" >> logs.txt
				ERROR=1
                        fi
                fi
}
