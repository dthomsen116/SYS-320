

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

