: '

Bu dosya bölünebilme kurallarını sayılara uygulayan 
fonksiyonları içerir.

'
#!/bin/bash
source /usr/share/primecontroller/bin/rules.sh # Kural fonksiyonlarının içe aktarılması
source /usr/share/primecontroller/bin/dot.sh # Nokta fonksiyonlarının içe aktarılması

control(){
    : '

    Bu fonksiyon global olarak tutulan maxValue değerini rules dosyasındaki tüm kurallara tabi tutarak
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
        stringArrayElement="F($fNumber)=$returnValueWithDots"
        stringArray=($stringArrayElement "${stringArray[@]}")
        fNumber=$(( fNumber + 1 ))
        flag=0
    else # Eğer sayı asal ise
        primeControl # Kendi kurallarımızdan asal kontrolünü geçmesi ihtimali olan sayılara karşı gerçek asal sayı kontrolü
        if [[ $? -eq 0 ]]; then
            setDots $maxValue # Sonuca noktaları ekleme
            stringArrayElement="F($fNumber)=$returnValueWithDots"
            stringArray=($stringArrayElement "${stringArray[@]}")
            fNumber=$(( fNumber + 1 ))
        else
            setDots $maxValue # Sonuca noktaları ekleme
            stringArrayElement="F($fNumber)=$returnValueWithDots(PRIME)"
            stringArray=($stringArrayElement "${stringArray[@]}")
            fNumber=$(( fNumber + 1 ))
        fi

    flag=0
    fi
}

primeControl(){
    : '

    Bu fonksiyon kendi kurallarımızdan asal kontrolünü geçmesi ihtimali olan sayılara 
    karşı gerçek asal sayı kontrolü yapar.

    Bu noktada programın gereğinden fazla uzun çalışması sorunundan ötürü optimizasyon
    çözümüne ihtiyaç duyulmuştur.

    Bu sorunun çözümüne istinaden 6k+-1 optimizasyonu kullanılmıştır.

    Kaynak : https://en.wikipedia.org/wiki/Primality_test

    '
    if [ $maxValue -eq 2 ] || [ $maxValue -eq 3 ]; then
        return 1 
    fi
    if [ $(($maxValue % 2)) -eq 0 ] || [ $(($maxValue % 3)) -eq 0 ]; then
        return 0 
    fi

    m=5 
    n=2

    while [ $((m * m)) -le $maxValue ]; 
    do
        if [ $(($maxValue % m)) -eq 0 ]; 
        then
            return 0 
        fi
        m=$((m + n))
        n=$((6 - n))
    done
    return 1
}