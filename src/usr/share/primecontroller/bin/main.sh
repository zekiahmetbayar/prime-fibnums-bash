#!/bin/bash
"""

@Author -> Zeki Ahmet Bayar

"""
source ./control.sh # Kontrol fonksiyonlarının içe aktarılması
source ./dot.sh # Nokta fonksiyonlarının içe aktarılması

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue # Kullanıcıdan değerin alınması

getDots $maxValue 
maxValue=$returnValueWithoutDots # Alınan sayının noktalarının temizlenmesi

export maxValue # Noktaları temizlenen sayının dışa aktarılması

range=$(( $maxValue - 2 )) 

if [ $range -gt 4100200300 ];then # Sayının limitlere uyup uymadığının kontrolü
    echo "Please enter a smaller number !"
else

    # Fibonacci sayı dizisinin oluşturulması ve
    # her bir fibonacci sayı dizisine ait sayının
    # kontrol işlemlerine sokulması 

    n1=1
    n2=1
    echo "$n1 (PRIME)"
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