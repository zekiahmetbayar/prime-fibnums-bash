#!/bin/bash
source ./rules.sh

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue

export maxValue
returnArray=()

checkDivideByTwo
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByThree
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByFour
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByFive
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideBySix
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideBySeven
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByEight
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByNine
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByTen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByEleven
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByTwelve
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByThirteen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByFifteen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideBySeventeen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByEighteen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByNineteen
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByTwentyThree
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByTwentyFour
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")

checkDivideByTwentyFive
returnValue=$?
returnArray=($returnValue "${returnArray[@]}")
    
echo ${returnArray[*]}
