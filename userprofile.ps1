### Script used to backup userprofile data 
### Script shall take place nightly 
### robocopy shall be used to  backup user profile data 
### Copies Users folder on desktop to shared linux file L:\

# Network share authentication
$shareuser = "rdibble"
$sharepswd = "Solarwinds123"

#Source Destination
$sourceuser = "C:\Users\Ryan Dibble" 

## \\10.0.0.85\files is the shared file server path
$netdrive = "\\10.0.0.85\files"
## robocopy used to back up files
## /Mir Mirrors Directory Tree
## /XA:SH excludes System Hidden Files
## /XD AppData excludeds App Data directory
## /XJD exludes junction points

Net USE $netdrive /u:\$shareuser $sharepswd
robocopy $sourceuser $netdrive /MIR /XA:SH  /XD AppData /XJD
Net USE $netdrive /D