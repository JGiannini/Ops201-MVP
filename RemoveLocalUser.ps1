##Author:      Ben Podawiltz
##Script:       Remove Local user with Powershell
##Date:         4.1.21
##Purpose:      To remove a local user with powershell command

#variables
$DeleteUser = Read-Host -Prompt 'Enter UserName to Delete:'


#function

if($DeleteUser) {

    Remove-LocalUser -Name $DeleteUser -Confirm

    }




