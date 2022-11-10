#Spam an email using powershell

#Who to send it to 
$toSend = @('david.thomsen@mymail.champlain.edu', 'david@mymail.champlain.edu', 'thomsen@mymail.champlain.edu')


# message body
$msg = "Hello!"


while ($true) {

    foreach ($email in $toSend) {

        #Send the Email
        Write-Host "Send-MailMessage -from 'david.thomsen@mymail.champlain.edu' -To $email -Subject 'This is the Subject' -Body $msg -SmtpServer x.x.x.x"

        
    }
}