#A simple script to add/update registry values in Windows. 
#For Win7 onwards
#2017 ilogreensward

$reg = "HKCU:\Control Panel\International"  # Registry path to work in
$name = "sShortTime"                        # Registry property to be changed
$value = "HH:mm"                            # Value of said registry property
$propType = "String"                        # Type of registry property (String, ExpandString, Binary, Dword, MultiString, Qword, Unknown)


echo "Registry Property Modification Script"

IF(!(Test-Path $reg)){ 

echo "Couldn't find $reg. Please check the path. "

}
else{

echo "Found registry path $reg "
echo "Setting property $name with value $value"


$confirmation = Read-Host "Are you sure you wish to perform these modifications? Y/N "
IF($confirmation -eq 'y'){

echo "Please check that the information below is correct: "
New-ItemProperty -Path $reg -Name $name -Value $value -PropertyType $propType -Force

}
else{

echo "Operation cancelled. Exiting script." 

}


}

