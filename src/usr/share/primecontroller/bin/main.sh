#!/bin/bash
source ./control.sh
source ./dot.sh

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue

getDots $maxValue
maxValue=$returnValueWithoutDots

export maxValue

range=$(( $maxValue - 2 ))

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