#Login to remote SSH

cls

#New-SSHSession -ComputerName '192.169.4.22' -Credential (Get-Credential sys320)
#pass sys320

while ($True) {

    #add a prompt to run cmds
    $the_cmd = Read-Host -Prompt 'please enter a command:'

    #run cmd on remote server
    (Invoke-SSHCommand -Index 0 $the_cmd).Output

}


Set-SCPItem -ComputerName '192.168.4.22' -Credential (Get-Credential sys320) `
-Destination '/home/sys20' -LocalFile '.\tedx.jpeg'