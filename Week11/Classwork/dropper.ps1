#Spam an email using powershell


$writeSbBot = @'


#Who to send it to 
$toSend = @('david.thomsen@mymail.champlain.edu', 'david@mymail.champlain.edu', 'thomsen@mymail.champlain.edu')


# message body
$msg = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."


while ($true) {

    foreach ($email in $toSend) {

        #Send the Email
        Write-Host "Send-MailMessage -from 'david.thomsen@mymail.champlain.edu' -To $email -Subject 'This is the Subject' -Body $msg -SmtpServer x.x.x.x"

        
    }
}

'@

$sbDir = 'C:\Users\dthom\Documents\SYS-320\Week11\Classwork\'

# create a random number to add to the file
$sbRand = Get-Random -Minimum 1000 -Maximum 3000

# create the file and location to save it
$file = $sbDir + $sbRand + 'winevent.ps1'

#write this to a file
$writeSbBot | Out-File -FilePath $file