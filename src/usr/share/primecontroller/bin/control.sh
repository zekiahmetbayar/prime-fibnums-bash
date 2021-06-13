#!/bin/bash
source ./rules.sh
source ./dot.sh

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
        setDots $maxValue
        echo $returnValueWithDots
        flag=0
    else
        primeControl
        if [[ $? -eq 0 ]]; then
            setDots $maxValue
            echo $returnValueWithDots
        else
            setDots $maxValue
            echo "$returnValueWithDots (PRIME)"
        fi

    flag=0
    fi
}

primeControl(){

    if [[ $maxValue -eq 2 ]] || [[ $maxValue -eq 3 ]]; then
        return 1 
    fi
    if [[ $(($maxValue % 2)) -eq 0 ]] || [[ $(($maxValue % 3)) -eq 0 ]]; then
        return 0 
    fi

    i=5; w=2
    while [[ $((i * i)) -le $maxValue ]]; 
    do
        if [[ $(($maxValue % i)) -eq 0 ]]; 
        then
            return 0 
        fi
        i=$((i + w))
        w=$((6 - w))
    done
    return 1
}