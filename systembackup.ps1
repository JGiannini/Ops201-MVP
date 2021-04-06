### Script for Systembackup ###


### Script utilizes wbadmin which enables you to back up and restore OS. 
### Sceduled task must be ran as a member of the ADMIN group            
### wbadmin needs to be ran with elevated privellages                    

#user authentication
$shareuser =  "rdibble"
$sharepass = "Solarwinds123"

#network drive location
$netdrive = "\\10.0.0.85\files"

### -backuptarget specifies storage location for backup     
### -inlude list of items to inlude in backup               
### -allCritical all critical volumes (OS State)           
### -quiet runs commapt w/ no prompt to user               

wbadmin start backup -user:$shareuser -password:$sharepass -backuptarget:$netdrive -include:c: -allcritical -quiet