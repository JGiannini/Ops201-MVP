##Tittle:   Windows 10 Pro Remove local user
##Author:   Ben Podawiltz
##Date:     4.1.21    
##Revision:      
##Purpose:  Removing a local user account with powershell command for Windows 10 Pro. Home edition will not allow access to new users folder in computer management.


#variables
$DeleteUser = Read-Host -Prompt 'Enter UserName to Delete:'


#function

if($DeleteUser) {

    Remove-LocalUser -Name $DeleteUser -Confirm

    }


#End

