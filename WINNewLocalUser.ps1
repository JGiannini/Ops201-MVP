##Title:    Windows 10 Pro New Local User   
##Author:   Ben Podawiltz
##Date:     4.1.21
##Revision: 
##Purpose:  Adding a new local user account to windows 10 Pro.  Home edition will not allow access to new users folder in computer management.


#variables
$NewUser = Read-Host -Prompt 'User Name to Add:'
$UserPassword = Read-Host -Prompt 'Add Secure Password for New User' -AsSecureString


#function
if ($NewUser) {
   
    Write-Host "Adding [$NewUser] to local device"
  
    }
    
if  ($UserPassword) {

    New-LocalUser -Name $NewUser -Password $UserPassword

    }
