#!/bin/bash

setDots(){
    value=$1
    digitNumberOfValue="${#value}"

    if [ $digitNumberOfValue -ge 4 ] 
    then
        returnValueWithDots=`echo $value | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta'`
    else
        returnValueWithDots=$value
    fi
}

getDots(){
    valueWithDots=$1

    returnValueWithoutDots=`echo "${valueWithDots//./}"`
}
