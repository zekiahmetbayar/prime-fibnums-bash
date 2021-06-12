#!/bin/bash
source /usr/share/primecontroller/bin/rules.sh

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue

range=$(( $maxValue - 2 ))

control(){
    returnArray=()
    flag=0

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
    
    returnArrayLength=0
    returnArrayLength=${#returnArray[@]}


    for ((i=0; i<$returnArrayLength; i++))
    do  
        element="${returnArray[$i]}"
        if [ $element -eq 1 ];then
            flag=1
            break
        fi
    done   

    if [ $flag -eq 1 ];then
        echo $maxValue
        flag=0
    else
        # sample usage
        primeControl $maxValue
        if [[ $? -eq 0 ]]; then
            echo "$maxValue"
        else
            echo "$maxValue (PRIME)"
        fi

    flag=0
    fi
}

primeControl(){
    if [[ $1 -eq 2 ]] || [[ $1 -eq 3 ]]; then
        return 1  # prime
    fi
    if [[ $(($1 % 2)) -eq 0 ]] || [[ $(($1 % 3)) -eq 0 ]]; then
        return 0  # not a prime
    fi
    i=5; w=2
    while [[ $((i * i)) -le $1 ]]; do
        if [[ $(($1 % i)) -eq 0 ]]; then
            return 0  # not a prime
        fi
        i=$((i + w))
        w=$((6 - w))
    done
    return 1  # prime
}

if [ $range -gt 4100200300 ];then
    echo "Please enter a smaller number !"
else
    n1=1
    n2=1
    echo "$n2 (PRIME)"
    echo "$n2 (PRIME)"
    n3=0
    while [[ $range -gt $n3 ]]
    do
        n3=$(( $n1 + $n2))
        n1=$n2
        n2=$n3

        maxValue=$n3
        control
    done
fi