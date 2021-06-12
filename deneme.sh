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

lastElement="${integerArray[-1]}"
unset integerArray[-1]

arrayLength=${#integerArray[@]}
multipliedLastElement=$((2*$lastElement))

multiplyValue=1 
loopStart=$(( $arrayLength - 1 ))

for ((i=$loopStart; i>=0; i--))
do
    element="${integerArray[$i]}"
    add=$(($element*$multiplyValue))
    sumOfInteger=$(( $sumOfInteger + $add ))
    multiplyValue=$((10*$multiplyValue))
done

decreasedNumber=$(($sumOfInteger-$multipliedLastElement))

if [ $((decreasedNumber%7)) -eq 0 ];then
    echo 1
else
     echo 0
fi