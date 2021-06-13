#!/bin/bash

setDots(){
    """

    Bu fonksiyon elde edilen sonuca noktaları ekler.

    100000 -> 100.000
    
    """
    
    value=$1 # Sonucun parametre olarak alınması
    digitNumberOfValue="${#value}" # Sonucun masamak sayısının alınması

    if [ $digitNumberOfValue -ge 4 ] # Dört veya daha büyük basamağa sahipse noktaların eklenmesi
    then
        returnValueWithDots=`echo $value | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta'`
    else
        returnValueWithDots=$value # Değilse aynen döndürülmesi
    fi
}

getDots(){
    """

    Bu fonksiyon girilen sayıdan noktaları çıkarır.

    100.000 -> 100000

    """
    
    valueWithDots=$1

    returnValueWithoutDots=`echo "${valueWithDots//./}"`
}
