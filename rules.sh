#!/bin/bash

checkDivideByTwo(){
    local maxValue=$maxValue    
    if [ $maxValue -eq 2 ];then
        return 0
    else
        lastDigit=${maxValue: -1}
        if [ $((lastDigit%2)) -eq 0 ] 
        then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByThree(){
    local maxValue=$maxValue
    if [ $maxValue -eq 3 ];then
        return 0
    else
        temp=0
        sum=0
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
    fi
}

checkDivideByFour(){
    local maxValue=$maxValue
    numberOfDigits=0
    numberOfDigits="${#maxValue}"
        
    if [ "$numberOfDigits" -ge "2" ]; then
        lastTwoDigit=${maxValue: -2}
        firstDigitOfLastTwoDigit="${lastTwoDigit:0:1}"
        if [ $firstDigitOfLastTwoDigit -ne "0" ];then
            if [ $lastTwoDigit -eq "00" ] || [ $((lastTwoDigit%4)) -eq 0 ];then
                return 1
            else
                return 0
            fi
        fi
    else
        lastDigit=0
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
    local maxValue=$maxValue
    if [ $maxValue -eq 5 ];then
        return 0
    else
        lastDigit=0
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
    fi
}

checkDivideBySix(){
    local maxValue=$maxValue
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

checkDivideBySeven(){
    local maxValue=$maxValue
    integerArray=()
    temp=0
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    lastElement="${integerArray[-1]}"
    unset integerArray[-1]

    arrayLength=${#integerArray[@]}
    multipliedLastElement=$((2 * $lastElement))

    multiplyValue=1 
    sumOfInteger=0
    loopStart=$(( $arrayLength - 1 ))

    for ((i=$loopStart; i>=0; i--))
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        sumOfInteger=$(( $sumOfInteger + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    decreasedNumber=0
    decreasedNumber=$(($sumOfInteger-$multipliedLastElement))

    if [ $((decreasedNumber%7)) -eq 0 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByEight(){
    local maxValue=$maxValue
    if [ $maxValue -eq 8 ];then
        return 0
    else
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
    fi
}


checkDivideByNine(){
    local maxValue=$maxValue
    sum=0
    while [[ $maxValue -gt 0 ]]
    do
            let temp=$maxValue%10
            let sum=$sum+$temp
            let maxValue=$maxValue/10
    done

    if [ $((sum%9)) -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByTen(){
    local maxValue=$maxValue
    lastDigit=${maxValue: -1}
    if [ $lastDigit -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByEleven(){
    local maxValue=$maxValue
    digitsArray=()
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        digitsArray=($temp "${digitsArray[@]}")
        let maxValue=$maxValue/10
    done

    digitsLength=${#digitsArray[@]}
    sumOfAdd=0
    sumOfDec=0

    for ((i=0; i<$digitsLength; i++))
    do
        if [ $((i%2)) -eq 0 ];then
            sumOfAdd=$(($sumOfAdd + "${digitsArray[$i]}"))
        else
            sumOfDec=$(($sumOfDec + "${digitsArray[$i]}"))
        fi
    done

    decreasedNumber=0
    decreasedNumber=$(($sumOfAdd-$sumOfDec))

    if [ $decreasedNumber -ge 0 ];then
        if [ $((decreasedNumber%11)) -eq 0 ];then
            return 1
        else
            return 0 
        fi
    else
        decreasedNumber=$(($decreasedNumber+11))
        if [ $((decreasedNumber%11)) -eq 0 ];then
            return 1 
        else
            return 0 
        fi
    fi
}

checkDivideByTwelve(){
    local maxValue=$maxValue
    checkDivideByThree
    local isDivisibleByThree=$?

    checkDivideByFour
    local isDivisibleByFour=$?
    
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByFour -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByThirteen(){
    local maxValue=$maxValue
    if [ $maxValue -eq 13 ];then
        return 0
    else
        integerArray=()
        while [[ $maxValue -gt 0 ]]
        do
            let temp=$maxValue%10
            integerArray=($temp "${integerArray[@]}")
            let maxValue=$maxValue/10
        done

        secondPart="${integerArray[-1]}"
        secondPart=$(($secondPart * 4))
        unset integerArray[-1]
        arrayLength=${#integerArray[@]}

        multiplyValue=1 
        firstPart=0
        loopStart=$(( $arrayLength - 1 ))

        for ((i=$loopStart; i>=0; i--))
        do
            element="${integerArray[$i]}"
            add=$(($element*$multiplyValue))
            firstPart=$(( $firstPart + $add ))
            multiplyValue=$((10*$multiplyValue))
        done
        addedNumber=0
        addedNumber=$(($firstPart + $secondPart))

        if [ $((addedNumber%13)) -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByFifteen(){
    local maxValue=$maxValue
    checkDivideByThree
    local isDivisibleByThree=$?

    checkDivideByFive
    local isDivisibleByFive=$?
    
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByFive -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideBySeventeen(){
    local maxValue=$maxValue

    integerArray=()
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    secondPart="${integerArray[-1]}"
    secondPart=$(($secondPart * 5))
    unset integerArray[-1]
    arrayLength=${#integerArray[@]}

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 ))

    for ((i=$loopStart; i>=0; i--))
    do  
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    decreasedNumber=0
    decreasedNumber=$(($firstPart - $secondPart))
    if [ $((decreasedNumber%17)) -eq 0 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByEighteen(){
    local maxValue=$maxValue
    checkDivideByTwo
    local isDivisibleByTwo=$?

    checkDivideByNine
    local isDivisibleByNine=$?
    
    if [ $isDivisibleByTwo -eq 1 ] && [ $isDivisibleByNine -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByNineteen(){
    local maxValue=$maxValue
    integerArray=()
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    secondPart="${integerArray[-1]}"
    secondPart=$(($secondPart * 2))
    unset integerArray[-1]
    arrayLength=${#integerArray[@]}

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 ))

    for ((i=$loopStart; i>=0; i--))
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    addedNumber=0
    addedNumber=$(($firstPart + $secondPart))

    if [ $((addedNumber%19)) -eq 0 ];then
        return 1
    else
        return 0
    fi
}


checkDivideByTwentyThree(){
    local maxValue=$maxValue
    integerArray=()
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    secondPart="${integerArray[-1]}"
    secondPart=$(($secondPart * 7))
    unset integerArray[-1]
    arrayLength=${#integerArray[@]}

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 ))

    for ((i=$loopStart; i>=0; i--))
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    addedNumber=0
    addedNumber=$(($firstPart + $secondPart))

    if [ $((addedNumber%23)) -eq 0 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByTwentyFour(){
    local maxValue=$maxValue
    checkDivideByThree
    local isDivisibleByThree=$?

    checkDivideByEight
    local isDivisibleByEight=$?
    
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByEight -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByTwentyFive(){
    local maxValue=$maxValue

    numberOfDigits="${#maxValue}"
    
    if [ "$numberOfDigits" -ge "2" ]; then
        lastTwoDigit=${maxValue: -2}
        if [ $lastTwoDigit -eq "25" ] || [ $lastTwoDigit -eq "50" ] || [ $lastTwoDigit -eq "75" ] || [ $lastTwoDigit -eq "00" ];then
            return 1
        else
            return 0
        fi
    else
        return 0
    fi
}