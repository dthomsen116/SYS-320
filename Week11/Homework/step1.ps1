$HomeDir = "C:\Users\dthom\Documents\SYS-320\Week11\Homework\EnNoB-1214.exe"

# Copy item 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe' to home dir
Copy-Item "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" -Destination $HomeDir

#does the file Exist?
if (Test-Path -Path $HomeDir) { 

    Write-Host File Exists
} 
else {

    Write-Host File does not exist or has not been created. 
}


#PT 2

$demands = "If you want your files restored, please contact me at dunston@champlain.edu. I look forward to doing business with you."

$ReadMeDir = "C:\Users\dthom\Desktop\Readme.READ"

#uses the vars to write the demands to the desktop. 
Out-File -FilePath $ReadMeDir -Encoding ascii -InputObject $demands

if (Test-Path -Path $ReadMeDir) { 

    Write-Host File Exists
} 
else {

    Write-Host File does not exist or has not been created. 
}