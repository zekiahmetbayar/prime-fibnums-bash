: '

Bu dosya yalnızca bölünebilme kurallarını içerir.

Kurallar listesi :

    * 2ye bölünebilme kuralı
    * 3e bölünebilme kuralı
    * 4e bölünebilme kuralı
    * 5e bölünebilme kuralı
    * 6ya bölünebilme kuralı
    * 7ye bölünebilme kuralı
    * 8e bölünebilme kuralı
    * 9a bölünebilme kuralı
    * 10a bölünebilme kuralı
    * 11e bölünebilme kuralı
    * 12ye bölünebilme kuralı
    * 13e bölünebilme kuralı
    * 15e bölünebilme kuralı
    * 17e bölünebilme kuralı
    * 18e bölünebilme kuralı
    * 19a bölünebilme kuralı
    * 23e bölünebilme kuralı
    * 24e bölünebilme kuralı
    * 25e bölünebilme kuralı

'
#!/bin/bash

checkDivideByTwo(){
    : '
    Gelen değerin ikiye bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Son rakamı çift sayı ise bölünür. Bir tam sayı 2 ile bölünmezse kalan her zaman 1 olur.

    '
    
    local maxValue=$maxValue    
    if [ $maxValue -eq 2 ];then 
        return 0
    else
        lastDigit=${maxValue: -1} # Sayının son elemanının alınması
        if [ $((lastDigit%2)) -eq 0 ] # Eğer son eleman ikiye bölünüyorsa
        then
            return 1 
        else
            return 0
        fi
    fi
}

checkDivideByThree(){
    : '
    Gelen değerin üçe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Rakamların değerleri toplamı 3 veya üçün katlarıysa bölünür.
    
    '

    local maxValue=$maxValue
    if [ $maxValue -eq 3 ];then # Eğer gelen sayı kendisi ise 0 döndür
        return 0
    else
        temp=0
        sum=0
        while [[ $maxValue -gt 0 ]] # Sayının basamaklar toplamını al
        do
                let temp=$maxValue%10
                let sum=$sum+$temp
                let maxValue=$maxValue/10
        done

        if [ $((sum%3)) -eq 0 ] # Eğer basamaklar toplamı 3'e bölünüyorsa
        then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByFour(){
    : '
    Gelen değerin dörde bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının birler ve onlar basamağı 00 ya da 4ün katı ise sayı 4 ile bölünür.
    
    '

    local maxValue=$maxValue
    numberOfDigits=0
    numberOfDigits="${#maxValue}" # Sayının kaç basamaklı olduğunu al
        
    if [ "$numberOfDigits" -ge "2" ]; then # Eğer iki basamaktan büyükse
        lastTwoDigit=${maxValue: -2}
        firstDigitOfLastTwoDigit="${lastTwoDigit:0:1}" # Kontrol için son iki basamağını al
        if [ $firstDigitOfLastTwoDigit -ne "0" ];then
            if [ $lastTwoDigit -eq "00" ] || [ $((lastTwoDigit%4)) -eq 0 ];then # Son iki basamak 00 ya da 4'e tam bölünüyorsa
                return 1
            else
                return 0
            fi
        fi
    else # Sayı tek veya çift basamaklı ise
        lastDigit=0
        lastDigit=${maxValue: -1} # Son basamağını al
        if [ $((lastDigit%4)) -eq 0 ] # Son basamak 4'e tam bölünüyorsa
        then
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByFive(){
    : '
    Gelen değerin beşe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Son rakamı 0 veya 5 ise 5e bölünür.
    
    '

    local maxValue=$maxValue
    if [ $maxValue -eq 5 ];then # Eğer gelen sayı kendisi ise 0 döndür
        return 0
    else
        lastDigit=0
        lastDigit=${maxValue: -1} # Sayının son basamağını al
        if [ $lastDigit -eq 0 ] # Son basamak 0 ise
        then
            return 1
        else
            if [ $lastDigit -eq 5 ] # Son basamak 5'e tam bölünüyor ise
            then
                return 1
            else
                return 0
            fi
        fi
    fi
}

checkDivideBySix(){
    : '
    Gelen değerin altıya bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Sayı hem 2ye hem 3e kalansız bölünebiliyorsa 6ya da bölünür.
    
    '

    local maxValue=$maxValue
    checkDivideByTwo # İkiye bölünebilme fonksiyonunu çağır
    local isDivisibleByTwo=$? # Return değerini yakala

    checkDivideByThree # Üçe bölünebilme fonksiyonunu çağır
    local isDivisibleByThree=$? # Return değerini yakala
    
    # Eğer sayı hem iki hem de üçe tam bölünüyorsa
    if [ $isDivisibleByTwo -eq 1 ] && [ $isDivisibleByThree -eq 1 ];then 
        return 1
    else
        return 0
    fi
}

checkDivideBySeven(){
    : '
    Gelen değerin yediye bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Sayının son rakamı 2 ile çarpılır ve elde edilen sayı ilk sayının son rakamı haricindeki 
    rakamların oluşturduğu sayıdan çıkarılır. Çıkan sayı 7nin katı veya 0 ise bu sayı da 7ye tam bölünüyor demektir.
    
    '

    local maxValue=$maxValue
    integerArray=()
    temp=0
    while [[ $maxValue -gt 0 ]] # Sayıyı oluşturan rakamları bir diziye at
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    lastElement="${integerArray[-1]}" # Sayının son basamağını al
    unset integerArray[-1] # Son basamağı diziden çıkart

    arrayLength=${#integerArray[@]} # Sayının kaç basamaklı olduğunu al
    multipliedLastElement=$((2 * $lastElement)) # Son basamağı iki ile çarp

    multiplyValue=1 
    sumOfInteger=0
    loopStart=$(( $arrayLength - 1 )) 

    # Son basamak çıktıktan sonra kalan sayının basamak değerleri toplamını bul
    for ((i=$loopStart; i>=0; i--)) 
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        sumOfInteger=$(( $sumOfInteger + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    # Son basamağın iki katını kalan sayıdan çıkart
    decreasedNumber=0
    decreasedNumber=$(($sumOfInteger-$multipliedLastElement))

    # Çıkan sayı 7'ye tam bölünüyorsa
    if [ $((decreasedNumber%7)) -eq 0 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByEight(){
    : '
    Gelen değerin sekize bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Son üç basamağının oluşturduğu sayı 000 ya da 8 in katı ise bölünür.
    
    '

    local maxValue=$maxValue
    if [ $maxValue -eq 8 ];then # Eğer gelen sayı kendisi ise 0 döndür
        return 0
    else
        numberOfDigits="${#maxValue}" # Sayının kaç basamaklı olduğunu al
        
        if [ "$numberOfDigits" -ge "3" ]; then # Eğer sayı 3 basamaktan fazla ise
            lastThreeDigit=${maxValue: -3} # Son 3 basamağı al

            # Son üç basamak 000 ise veya 8'e tam bölünüyorsa
            if [ $lastThreeDigit -eq "000" ] || [ $((lastThreeDigit%8)) -eq 0 ];then
                return 1
            else
                return 0
            fi
        else # Sayı 3 basamaklı veya 3 basamaktan küçükse
            if [ $((maxValue%8)) -eq 0 ];then
                return 1
            else
                return 0
            fi
        fi
    fi
}


checkDivideByNine(){
    : '
    Gelen değerin dokuza bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Rakamların sayı değerleri toplamı 9 veya dokuzun katlarıysa bölünür. 
    
    '

    local maxValue=$maxValue
    sum=0
    while [[ $maxValue -gt 0 ]] # Sayının basamakları toplamını al
    do
            let temp=$maxValue%10
            let sum=$sum+$temp
            let maxValue=$maxValue/10
    done

    # Basamaklar toplamı 9'a tam bölünüyorsa
    if [ $((sum%9)) -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByTen(){
    : '
    Gelen değerin ona bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Son rakamı 0 ise bölünür.
    
    '

    local maxValue=$maxValue
    lastDigit=${maxValue: -1} # Sayının son basamağını al

    # Son basamak 0 ise
    if [ $lastDigit -eq 0 ] 
    then
        return 1
    else
        return 0
    fi
}

checkDivideByEleven(){
    : '
    Gelen değerin on bire bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 11 ile tam olarak bölünebilmesi için, sayının rakamlarının altına birler basamağından
    başlayarak sırasıyla +, -, +, -, ... işaretleri yazılır, artılı gruplar kendi arasında ve eksili gruplar kendi
    arasında toplanır, farkı alınır. Genel toplamın 11 e bölümünde kalan 0 ise sayı 11e tam bölünür. Sonuç
    negatif çıkarsa sonuca +11 eklenir.
    
    '

    local maxValue=$maxValue
    digitsArray=()

    # Sayıyı oluşturan rakamları bir diziye at
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        digitsArray=($temp "${digitsArray[@]}")
        let maxValue=$maxValue/10
    done

    digitsLength=${#digitsArray[@]} # Sayının kaç basamaklı olduğunu al
    sumOfAdd=0
    sumOfDec=0

    # Sayıyı birler basamağından başlayarak ayır
    for ((i=0; i<$digitsLength; i++))
    do
        if [ $((i%2)) -eq 0 ];then
            sumOfAdd=$(($sumOfAdd + "${digitsArray[$i]}")) # + işaretli olanları topla
        else
            sumOfDec=$(($sumOfDec + "${digitsArray[$i]}")) # - işaretli olanları topla
        fi
    done

    decreasedNumber=0
    decreasedNumber=$(($sumOfAdd-$sumOfDec)) # + ve - işaretli toplamları birbirinden çıkart

    if [ $decreasedNumber -ge 0 ];then # Çıkan sayı 11'den büyükse 
        if [ $((decreasedNumber%11)) -eq 0 ];then # 11'e tam bölünüyorsa
            return 1
        else
            return 0 
        fi
    else
        decreasedNumber=$(($decreasedNumber+11)) # Çıkan sayı 11'den küçükse 
        if [ $((decreasedNumber%11)) -eq 0 ];then # Çıkan sayı 11'e tam bölünüyorsa
            return 1 
        else
            return 0 
        fi
    fi
}

checkDivideByTwelve(){
    : '
    Gelen değerin on ikiye bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 12ye tam bölünmesi için, 3 ve 4e tam olarak bölünmesi gerekir.
    
    '

    local maxValue=$maxValue
    checkDivideByThree # Üçe bölünebilme fonksiyonunu çağır
    local isDivisibleByThree=$? # Return değerini yakala

    checkDivideByFour # Dörde bölünebilme fonksiyonunu çağır
    local isDivisibleByFour=$? # Return değerini yakala
    
    # Sayı her ikisine de tam bölünüyorsa
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByFour -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByThirteen(){
    : '
    Gelen değerin on üçe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 13e tam bölünüp bölünmediğini anlamak için o sayıyı 
    10a+b şeklinde yazmamız gerekmektedir. Sonrasında bulduğumuz a ve b değerlerini a+4b şeklinde yazdığımızda 
    çıkan sonuç 13 ile tam bölünebiliyorsa ilk sayı da 13e tam bölünebiliyor demektir.
    
    '

    local maxValue=$maxValue
    if [ $maxValue -eq 13 ];then # Gelen sayı kendisi ise 0 döndür
        return 0
    else
        integerArray=()
        # Sayının elemanlarını diziye at
        while [[ $maxValue -gt 0 ]]
        do
            let temp=$maxValue%10
            integerArray=($temp "${integerArray[@]}")
            let maxValue=$maxValue/10
        done

        secondPart="${integerArray[-1]}" # Sayının son elemanını al
        secondPart=$(($secondPart * 4)) # Son elemanı 4 ile çarp
        unset integerArray[-1] # Son elemanı diziden çıkart
        arrayLength=${#integerArray[@]} # Kalan dizinin uzunluğunu al

        multiplyValue=1 
        firstPart=0
        loopStart=$(( $arrayLength - 1 ))

        # Kalan sayının basamak değerlerini topla
        for ((i=$loopStart; i>=0; i--))
        do
            element="${integerArray[$i]}"
            add=$(($element*$multiplyValue))
            firstPart=$(( $firstPart + $add ))
            multiplyValue=$((10*$multiplyValue))
        done

        addedNumber=0
        addedNumber=$(($firstPart + $secondPart)) # Kalan sayıdan son elemanın 4 katını çıkart

        if [ $((addedNumber%13)) -eq 0 ];then # Sayı 13'e tam bölünüyorsa
            return 1
        else
            return 0
        fi
    fi
}

checkDivideByFifteen(){
    : '
    Gelen değerin on dörde bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 15 ile bölünebilmesi için, bu sayının hem 3 ile hem de 5 ile tam olarak bölünmesi gerekir.

    '

    local maxValue=$maxValue
    checkDivideByThree # Üçe bölünebilme fonksiyonunu çağır
    local isDivisibleByThree=$? # Return değerini yakala

    checkDivideByFive # Beşe bölünebilme fonksiyonunu çağır
    local isDivisibleByFive=$? # Return değerini yakala
    
    # Sayı ikisine de tam bölünüyorsa
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByFive -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideBySeventeen(){
    : '
    Gelen değerin on beşe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Sayıyı X=10a+b şeklinde yazdığımızda a-5b sayısı 17ye kalansız bölünmesiyle oluşur.
    
    '

    local maxValue=$maxValue

    integerArray=()
    # Sayının elemanlarını bir diziye at
    while [[ $maxValue -gt 0 ]]
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done
    
    secondPart="${integerArray[-1]}" # Sayının son elemanını al
    secondPart=$(($secondPart * 5)) # Son elemanı 5 ile çarp
    unset integerArray[-1] # Diziden son elemanı çıkart
    arrayLength=${#integerArray[@]} # Kalan sayının basamak sayısını al

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 )) 

    # Kalan sayının basamak değerini al
    for ((i=$loopStart; i>=0; i--))
    do  
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    decreasedNumber=0
    decreasedNumber=$(($firstPart - $secondPart)) # Kalan sayıdan 5 ile çarpılmış son elemanı çıkart
    if [ $((decreasedNumber%17)) -eq 0 ];then # İşlem sonucu 17'ye bölünüyorsa
        return 1
    else
        return 0
    fi
}

checkDivideByEighteen(){
    : '
    Gelen değerin on sekize bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 18 ile bölünebilmesi için, bu sayının hem 2 ile hem de 9 ile tam olarak bölünmesi gerekir.
    
    '

    local maxValue=$maxValue
    checkDivideByTwo # İkiye bölünebilme fonksiyonunu çağır
    local isDivisibleByTwo=$? # Return değerini yakala

    checkDivideByNine # Dokuza bölünebilme fonksiyonunu çağır
    local isDivisibleByNine=$? # Return değerini yakala
    
    # Sayı her ikisine de tam olarak bölünüyorsa
    if [ $isDivisibleByTwo -eq 1 ] && [ $isDivisibleByNine -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByNineteen(){
    : '
    Gelen değerin on dokuza bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Sayıyı X=10a+b şeklinde yazdığımızda a+2b sayısı 19a kalansız bölünürse bölünebilir.
    
    '

    local maxValue=$maxValue
    integerArray=()
    
    while [[ $maxValue -gt 0 ]] # Sayının uzunluğunu al
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    secondPart="${integerArray[-1]}" # Sayının son elemanını al
    secondPart=$(($secondPart * 2)) # Son elemanı iki ile çarp
    unset integerArray[-1] # Son elemanı diziden çıkart
    arrayLength=${#integerArray[@]} # Kalan dizinin uzunluğunu bul

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 ))

    # Kalan sayının basamak değerini al
    for ((i=$loopStart; i>=0; i--))
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    addedNumber=0
    addedNumber=$(($firstPart + $secondPart)) # İki parçayı topla

    if [ $((addedNumber%19)) -eq 0 ];then # Sonuç 19'a tam bölünüyorsa
        return 1
    else
        return 0
    fi
}

checkDivideByTwentyThree(){
    : '
    Gelen değerin yirmi üçe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Sayıyı X=10a+b şeklinde yazdığımızda a+7b sayısı 23e kalansız bölünürse bölünebilir.
    
    '

    local maxValue=$maxValue
    integerArray=()
    while [[ $maxValue -gt 0 ]] # Sayının uzunluğunu al
    do
        let temp=$maxValue%10
        integerArray=($temp "${integerArray[@]}")
        let maxValue=$maxValue/10
    done

    secondPart="${integerArray[-1]}" # Sayının son elemanını al
    secondPart=$(($secondPart * 7)) # Son elemanı 7 ile çarp
    unset integerArray[-1] # Son elemanı diziden çıkart
    arrayLength=${#integerArray[@]} # Dizinin uzunluğunu al

    multiplyValue=1 
    firstPart=0
    loopStart=$(( $arrayLength - 1 ))

    # Kalan sayının basamak değerini al
    for ((i=$loopStart; i>=0; i--))
    do
        element="${integerArray[$i]}"
        add=$(($element*$multiplyValue))
        firstPart=$(( $firstPart + $add ))
        multiplyValue=$((10*$multiplyValue))
    done

    addedNumber=0
    addedNumber=$(($firstPart + $secondPart)) # İki parçayı topla

    if [ $((addedNumber%23)) -eq 0 ];then # Sonuç 23'e tam bölünüyorsa
        return 1
    else
        return 0
    fi
}

checkDivideByTwentyFour(){
    : '
    Gelen değerin yirmi dörde bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Bir sayının 24 ile bölünebilmesi için, bu sayının hem 3 ile hem de 8 ile tam olarak bölünmesi gerekir.
    
    '

    local maxValue=$maxValue
    checkDivideByThree # Üçe bölünebilme fonksiyonunu çağır
    local isDivisibleByThree=$? # Return değerini yakala

    checkDivideByEight # Sekize bölünebilme fonksiyonunu çağır
    local isDivisibleByEight=$? # Return değerini yakala
    
    # Sayı her ikisine de tam bölünüyorsa
    if [ $isDivisibleByThree -eq 1 ] && [ $isDivisibleByEight -eq 1 ];then
        return 1
    else
        return 0
    fi
}

checkDivideByTwentyFive(){
    : '
    Gelen değerin yirmi beşe bölünüp bölünmediğini kontrol eder.

    Bölünüyorsa 1, bölünmüyorsa 0 döndürür.

    Kural tanımı : Son iki rakamı 25, 50, 75, veya 00 olmalıdır.
    
    '

    local maxValue=$maxValue

    numberOfDigits="${#maxValue}" # Sayının uzunluğunu al

    # Sayı 2 basamaklı veya 2 basamaktan büyükse 
    if [ "$numberOfDigits" -ge "2" ]; then
        lastTwoDigit=${maxValue: -2} # Sayının son iki basamağını al

        # Son iki basamağı 25 veya 50 veya 75 veya 00'a eşitse 
        if [ $lastTwoDigit -eq "25" ] || [ $lastTwoDigit -eq "50" ] || [ $lastTwoDigit -eq "75" ] || [ $lastTwoDigit -eq "00" ];then
            return 1
        else
            return 0
        fi
    else
        return 0
    fi
}