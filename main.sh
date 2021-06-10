#!/bin/bash

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue


checkDivideByTwo(){
    lastDigit=${maxValue: -1}
    if [ $((lastDigit%2)) -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByThree(){
    local maxValue=$maxValue
    while [[ $maxValue -gt 0 ]]
    do
            let temp=$maxValue%10
            let sum=$sum+$temp
            let maxValue=$maxValue/10
    done

    if [ $((sum%3)) -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByFour(){
    numberOfDigits="${#maxValue}"
    
    if [ "$numberOfDigits" -ge "2" ]; then
        lastTwoDigit=${maxValue: -2}
        if [ $lastTwoDigit -eq "00" ] || [ $((lastTwoDigit%4)) -eq 0 ];then
            return 1
        else
            return 0
        fi
    else
        lastDigit=${maxValue: -1}
        if [ $((lastDigit%4)) -eq 0 ] 
        then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByFive(){
    lastDigit=${maxValue: -1}
    if [ $lastDigit -eq 0 ]
    then
        return 1
    else
        if [ $lastDigit -eq 5 ]
        then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideBySix(){
    checkDivideByTwo
    local isDivisibleByTwo=$?

    checkDivideByThree
    local isDivisibleByThree=$?
    
    if [ $isDivisibleByTwo -eq 1 ] && [ $isDivisibleByThree -eq 1 ];then
        return 1
    else
        return 0
    fi
}

#checkDivideBySeven(){
    # Will be add
#}

checkDivideByEight(){
    numberOfDigits="${#maxValue}"
    
    if [ "$numberOfDigits" -ge "3" ]; then
        lastThreeDigit=${maxValue: -3}
        if [ $lastThreeDigit -eq "000" ] || [ $((lastThreeDigit%8)) -eq 0 ];then
            return 1
        else
            return 0
        fi
    else
        if [ $((maxValue%8)) -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByEight
echo $?
