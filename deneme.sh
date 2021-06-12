#!/bin/bash
echo "Enter max value : (Max : 4.100.200.300)"
read maxValue

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
loopStart=$(( $arrayLength - 1 ))

for ((i=$loopStart; i>=0; i--))
do
    element="${integerArray[$i]}"
    add=$(($element*$multiplyValue))
    firstPart=$(( $firstPart + $add ))
    multiplyValue=$((10*$multiplyValue))
done

addedNumber=$(($firstPart + $secondPart))

if [ $((addedNumber%13)) -eq 0 ];then
    echo 1
else
    echo 0
fi