#Yleiskäyttöinen rekisterimuutos/lisäysskripti. Vaihda vain muuttujat reg, name, value ja propType oikeiksi.

$reg = Read-Host -Prompt 'Anna rekisterihaara, jossa muutoksia tehdään (esim. HKCU:\Control Panel\International) '  #rekisterihaara, jossa muutoksia tehdään
$name = Read-Host -Prompt 'Anna muutettavan rekisteripropertyn nimi, (esim. sShortTime) '                        #rekisteriproperty, jota muutetaan
$value = Read-Host -Prompt 'Anna muutettavan rekisteripropertyn arvo, (esim. HH:mm) '                            #rekisteripropertyn arvo, jota muutetaan
$propType = Read-Host -Prompt 'Anna muutettavan rekisteripropertyn tyyppi (String, ExpandString, Binary, Dword, MultiString, Qword, Unknown) ' #rekisteripropertyn tyyppi

echo "Olet syöttänyt seuraavat tiedot: "
echo " "
echo "Rekisterihaara: $reg"
echo "Propertyn nimi: $name"
echo "Propertyn arvo: $value"
echo "Propertyn tyyppi: $propType"
echo " "

$confirmation = Read-Host "Oletko varma, että haluat lisätä nämä tiedot rekisteriin? Y/N "


IF($confirmation -eq 'y'){

IF((Test-Path $reg)){ 

echo "Löydetty rekisterihaara $reg "
echo "Annetaan propertylle $name arvoksi $value"

echo "Tarkasta, että muutetut tiedot ovat oikein: "
New-ItemProperty -Path $reg -Name $name -Value $value -PropertyType $propType -Force

}
else{

echo "Rekisterihaaraa ei löydy. Tarkastathan oikeinkirjoituksen"

}
}
else{

echo "Rekisterioperaatio keskeytetty"

}

