#!/bin/bash
source ./rules.sh # Kural fonksiyonlarının içe aktarılması
source ./dot.sh # Nokta fonksiyonlarının içe aktarılması

control(){
    : '

    Bu fonksiyon global olarak tutulan maxValue değerini
    rules dosyasındaki tüm kurallara tabi tutarak
    asal sayı olup olmamasına göre ekrana basar.

    '
    returnArray=()
    flag=0

    # Sayının asal sayı kurallarına tabi tutulması

    checkDivideByTwo # İkiye bölünebilme kuralını uygulayan fonksiyonun çağırılması
    returnValue=$? # Fonksiyondan return edilen değerin yakalanması
    returnArray=($returnValue "${returnArray[@]}") # Yakalanan değerin kontrol dizisine atılması

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
    
    returnArrayLength=0 # Kontrol dizisinin set edilmesi
    returnArrayLength=${#returnArray[@]} # Kontrol dizisinin uzunluğunun alınması

    # Sayının asal olup olmamasına göre ekrana basılması

    for ((i=0; i<$returnArrayLength; i++))
    do  
        element="${returnArray[$i]}"
        if [ $element -eq 1 ];then
            flag=1
            break
        fi
    done   

    if [ $flag -eq 1 ];then # Eğer sayı asal değilse
        setDots $maxValue # Sonuca noktaların eklenmesi
        echo $returnValueWithDots 
        flag=0
    else # Eğer sayı asal ise
        primeControl # Kendi kurallarımızdan asal kontrolünü geçmesi ihtimali olan sayılara karşı gerçek asal sayı kontrolü
        if [[ $? -eq 0 ]]; then
            setDots $maxValue # Sonuca noktaları ekleme
            echo $returnValueWithDots
        else
            setDots $maxValue # Sonuca noktaları ekleme
            echo "$returnValueWithDots (PRIME)"
        fi

    flag=0
    fi
}

primeControl(){
    : '

    Bu fonksiyon kendi kurallarımızdan asal kontrolünü 
    geçmesi ihtimali olan sayılara karşı gerçek asal sayı 
    kontrolü yapar.

    '
    if [[ $maxValue -eq 2 ]] || [[ $maxValue -eq 3 ]]; then
        return 1 
    fi
    if [[ $(($maxValue % 2)) -eq 0 ]] || [[ $(($maxValue % 3)) -eq 0 ]]; then
        return 0 
    fi

    a=5 
    b=2

    while [[ $((a * a)) -le $maxValue ]]; 
    do
        if [[ $(($maxValue % a)) -eq 0 ]]; 
        then
            return 0 
        fi
        a=$((a + b))
        b=$((6 - b))
    done
    return 1
}