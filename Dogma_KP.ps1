<#
Title: KeePass Manager

Author: Jamie Giannini

About: This script helps admins manage and automate KeePass databases. Admins can view all password entries, view all groups, create a new password group, auto generate a secure password, 
add a new password, and update an existing password.

Requirements before use:
[X] KeePass and a MasterKey
[X] A KeePass database
[X] KeePass PowerShell module (install via "Install-Module -Name PoShKeePass")
[X] Establish a connection to the KeePass database with the "New-KeePassDatabaseConfiguration" command...
- Example of how I did this: New-KeePassDatabaseConfiguration -DatabaseProfileName 'DogmaAdmin' -DatabasePath "C:\Users\Administrator\KeePass\Database.kdbx" -UseMasterKey
[X] Verify the database profile is setup and points to the .kdbx database with this command: "Get-KeePassDatabaseConfiguration"

Thank you to the author of the open source PoShKeePass module, John Klann. Reference: https://github.com/PSKeePass/PoShKeePass 
Credit to Hayley Jane Wakenshaw for the ASCII key, and CoolGenerator.com for the ASCII text generator
#>

# Retrieves most recent passwords
function view_entries(){
Get-KeePassEntry -DatabaseProfileName DogmaAdmin -MasterKey $KeeCred.Password
}

# Retrieves most recent groups
function view_groups(){
Get-KeePassGroup -DatabaseProfileName DogmaAdmin -MasterKey $KeeCred.Password
}

# Creates a new group
function create_group(){
echo "Enter a name for the new group"
$grp_name = Read-Host
New-KeePassGroup -DatabaseProfileName DogmaAdmin -KeePassGroupName $grp_name -KeePassGroupParentPath "Database" -MasterKey $KeeCred.Password
echo "New group, named $grp_name , added!" 
}

# Creates a new auto-gen password. I also added the ability to choose pass length, title, and which group it should be added to
function gen_pass(){
echo "How long should it be? Enter a value between 8 - 50"
$pass_length = Read-Host
# convert input from string to int
[int]$pass_length = [convert]::ToInt32($pass_length, 10)
$new_password = New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length $pass_length 
#$new_password
echo "Add to a group? [Y/N]"
$user_input_add = Read-Host

if($user_input_add -eq "Y" -or $user_input_add -eq "YES" -or $user_input_add -eq "yes"){
echo "Provide a title for this password:"
$user_input_pass_name = Read-Host
echo "Provide a group for this password:"
$user_input_grp_name = Read-Host
New-KeePassEntry -DatabaseProfileName DogmaAdmin -Title $user_input_pass_name -UserName root -KeePassPassword $new_password -KeePassEntryGroupPath Database/$user_input_grp_name -MasterKey $KeeCred.Password
echo "New password added to $user_input_grp_name!"
}
elseif($user_input_add -eq "N" -or $user_input_add -eq "NO" -or $user_input_add -eq "no"){
echo "Provide a title for this password:"
$user_input_pass_name = Read-Host
echo "Here's your password (keep it safe): "
New-KeePassEntry -DatabaseProfileName DogmaAdmin -Title $user_input_pass_name -UserName root -KeePassPassword $new_password -KeePassEntryGroupPath Database -MasterKey $KeeCred.Password 
$KeePassEntry = Get-KeePassEntry -KeePassEntryGroupPath Database -Title $user_input_pass_name -DatabaseProfileName "DogmaAdmin" -MasterKey $KeeCred.Password 
Update-KeePassEntry -Title $user_input_pass_name -UserName root -KeePassPassword (New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length $pass_length) -KeePassEntryGroupPath Database -KeePassEntry $KeePassEntry -DatabaseProfileName 'DogmaAdmin' 
$KeePassEntry = Get-KeePassEntry -KeePassEntryGroupPath Database  -Title $user_input_pass_name -DatabaseProfileName "DogmaAdmin" -MasterKey $KeeCred.Password 
$showPass = New-Object System.Management.Automation.PSCredential("Root",$keepassentry.password) 
$showPass.GetNetworkCredential().password 
}
else{
echo "exit"
}

}

# Lets the user enter a new password (manual entry) and assign it to a group
function add_pass(){
echo "Provide a title for this password:"
$pass_title = Read-Host
echo "Enter the password:"
$pass_val = Read-Host
$new_val = New-KeePassEntry -DatabaseProfileName DogmaAdmin -Title $pass_title -UserName root -KeePassPassword $(ConvertTo-SecureString -String $pass_val -AsPlainText -Force) -MasterKey $KeeCred.Password
echo "Provide a group for this password:"
$user_input_grp_name_pass = Read-Host
New-KeePassEntry -DatabaseProfileName DogmaAdmin -Title $pass_title -UserName root -KeePassPassword $(ConvertTo-SecureString -String $pass_val -AsPlainText -Force) -KeePassEntryGroupPath Database/$user_input_grp_name_pass -MasterKey $KeeCred.Password
echo "Password added"
}

# Lets the user swap out an existing password with a new auto gen password 
function rotate_pass(){
echo "Enter title for password to update:"
$pass_to_update_title = Read-Host
echo "Enter group name for password:"
$pass_find_grp_name = Read-Host
echo "How long should it be? Enter a value between 8 - 50"
$pass_length_add = Read-Host
# convert input from string to int
[int]$pass_length_add = [convert]::ToInt32($pass_length_add, 10)
$updatedEntry = Get-KeePassEntry -KeePassEntryGroupPath Database/$pass_find_grp_name -Title $pass_to_update_title -DatabaseProfileName "DogmaAdmin" -MasterKey $KeeCred.Password
Update-KeePassEntry -Title $pass_to_update_title -UserName root -KeePassPassword (New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length $pass_length_add) -KeePassEntryGroupPath Database/$pass_find_grp_name -KeePassEntry $updatedEntry -DatabaseProfileName 'DogmaAdmin' -MasterKey $KeeCred.Password
echo "Password updated!"
}

# Begin program:
echo "
  ooo,    .---.
 o`  o   /    |\________________
o`   'oooo()  | ________   _   _)
`oo   o` \    |/        | | | |
  `ooo'   `---'         "-" |_| "
  

echo "
_  _ ____ ____ ___  ____ ____ ____    _  _ ____ _  _ ____ ____ ____ ____ 
|_/  |___ |___ |__] |__| [__  [__     |\/| |__| |\ | |__| | __ |___ |__/ 
| \_ |___ |___ |    |  | ___] ___]    |  | |  | | \| |  | |__] |___ |  \ "  

echo ""
echo "-------------------------------------------------------------"
echo "Please enter a number for the task you would like to execute:"
echo "(1) View all entries"
echo "(2) View all groups"
echo "(3) Create a group"
echo "(4) Generate a secure password"
echo "(5) Add a manually entered password"
echo "(6) Update existing password"
echo "(E) Exit program"

echo "-------------------------------------------------------------"
echo ""
$user_input = Read-Host
$KeeCred =  Get-Credential -Message 'MasterKey Password:' -UserName 'DogmaAdmin'  

if($user_input -eq 1){
view_entries
}
elseif($user_input -eq 2){
view_groups
}
elseif($user_input -eq 3){
create_group
}
elseif($user_input -eq 4){
gen_pass
}
elseif($user_input -eq 5){
add_pass
}
elseif($user_input -eq 5){
add_pass
}
elseif($user_input -eq 6){
rotate_pass
}
elseif($user_input -eq "E" -or $user_input -eq "e"){
echo "Cya later!"
}
else{
echo "Check input"
}

