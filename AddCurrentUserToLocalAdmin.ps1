#Add currently logged in user to local administrator group
#ilogreensward 2017

$domain = (Get-WmiObject Win32_ComputerSystem).Domain
echo "User currently logged in: $env:username"
echo "Domain: $domain"
$confirmation = Read-Host "Do you want to make $env:username into a local administrator on this computer? Y/N"

IF($confirmation -eq 'y'){
net localgroup Administrators "$domain\$env:username" /ADD
}
IF($confirmation -eq 'n'){
echo "Operation cancelled."
}
