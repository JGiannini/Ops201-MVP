##Author Ben Podawiltz
##Date: 4.7.21
##Revision:
##Purpose: Add a new user to active directory. 




#Variables
$NewUser = Read-Host "Please Enter New User Name [First Last}"
$LogOnName = Read-Host "Please Enter LogOn Name"
$Password = Read-Host "Please Enter Password" -AsSecureString
$Principal = $LogOnName + $Domain
$Domain = "@corp.flyhomes.local"

#function 

New-ADUser -Name $NewUser -SamAccountName $LogOnName -UserPrincipalName $Principal -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $True -ChangePasswordAtLogon $true







#End	
 
