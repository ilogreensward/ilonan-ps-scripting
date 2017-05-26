#Yleiskäyttöinen rekisterimuutos/lisäysskripti. Vaihda vain muuttujat reg, name, value ja propType oikeiksi.

$reg = "HKCU:\Control Panel\International"  #rekisterihaara, jossa muutoksia tehdään
$name = "sShortTime"                        #rekisteriproperty, jota muutetaan
$value = "HH:mm"                            #rekisteripropertyn arvo, jota muutetaan
$propType = "String"                        #rekisteripropertyn tyyppi




IF((Test-Path $reg)){ #jos rekisterihaara on olemassa

echo "Löydetty rekisterihaara $reg "
echo "Annetaan propertylle $name arvoksi $value"


$confirmation = Read-Host "Oletko varma, että haluat lisätä nämä tiedot rekisteriin? Y/N "
IF($confirmation -eq 'y'){

echo "Tarkasta, että muutetut tiedot ovat oikein: "
New-ItemProperty -Path $reg -Name $name -Value $value -PropertyType $propType -Force

}
else{

echo "Toiminto keskeytetty" 

}
}
else{

echo "Rekisterihaaraa ei löydy. Tarkastathan oikeinkirjoituksen"

}

