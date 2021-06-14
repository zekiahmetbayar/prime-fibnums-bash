: '
@Author -> Zeki Ahmet Bayar
@Number -> 030117092

Bu betiklerin temel amacı Fibonacci sayı dizisinde yer alan
sayıların asallık kontrolünü, bölünebilme kuralları ile yapmaktır.

Bölünebilme kurallarının yetmediği durumlarda kontrol geleneksel asal
sayı kontrolü algoritması ile yapılmaktadır.

Klasörde bulunan diğer dosyalar şu işlere yaramaktadır : 

dots.sh ->  Alınan ve ekrana basılan sayılara nokta ekler/siler.
control.sh -> O anki dizi sayısını kurallara tabi tutar, ve sonucu ekrana basar.
rules.sh -> Bölünebilme kurallarını içerir. 

'

#!/bin/bash

source ./control.sh # Kontrol fonksiyonlarının içe aktarılması
source ./dot.sh # Nokta fonksiyonlarının içe aktarılması

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue # Kullanıcıdan değerin alınması

getDots $maxValue 
maxValue=$returnValueWithoutDots # Alınan sayının noktalarının temizlenmesi

export maxValue # Noktaları temizlenen sayının dışa aktarılması

fNumber=2
range=$(( $maxValue - 2 )) 

if [ $range -gt 4100200300 ];then # Sayının limitlere uyup uymadığının kontrolü
    echo "Please enter a smaller number !"
else

    # Fibonacci sayı dizisinin oluşturulması ve
    # her bir fibonacci sayı dizisine ait sayının
    # kontrol işlemlerine sokulması 

    n1=1
    n2=1
    echo "F(0)=$n1 (PRIME)"
    echo "F(1)=$n2 (PRIME)"
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