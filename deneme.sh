#!/bin/bash
source ./rules.sh
echo "Enter max value : (Max : 4.100.200.300)"
read maxValue
returnArray=()
checkDivideByTwo
    returnValue="$?+2"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByThree
    returnValue="$?+3"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByFour
    returnValue="$?+4"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByFive
    returnValue="$?+5"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideBySix
    returnValue="$?+6"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideBySeven
    returnValue="$?+7"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByEight
    returnValue="$?+8"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByNine
    returnValue="$?+9"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByTen
    returnValue="$?+10"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByEleven
    returnValue="$?+11"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByTwelve
    returnValue="$?+12"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByThirteen
    returnValue="$?+13"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByFifteen
    returnValue="$?+15"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideBySeventeen
    returnValue="$?+17"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByEighteen
    returnValue="$?+18"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByNineteen
    returnValue="$?+19"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByTwentyThree
    returnValue="$?+23"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByTwentyFour
    returnValue="$?+24"
    returnArray=($returnValue "${returnArray[@]}")

    checkDivideByTwentyFive
    returnValue="$?+25"
    returnArray=($returnValue "${returnArray[@]}")

    echo ${returnArray[*]}