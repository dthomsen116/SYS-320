# Array of websites containing threat intell
$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules','https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

# Loop Through the URLs for the rules list
foreach ($u in $drop_urls) {

    # Extract the filename
    $temp = $u.Split("/")
    # The last element in the array plucked off is the filename
    $file_name = $temp[-1]

    if (Test-Path "./Week12/Homework/$file_name") {
        continue
    } 
    else {
    # Download the rules list
    Invoke-WebRequest -Uri $u -OutFile "./Week12/Homework/$file_name"
   
    }
}

# Array containing the filename
$input_path = @("./Week12/Homework/compromised-ips.txt","./Week12/Homework/emerging-botcc.rules")

# Extract the IP address: 108.190.109.107
$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

# Append the IP addresses to the temporary IP list
Select-String -Path $input_path -Pattern $regex_drop | `
ForEach-Object { $_.Matches } | `
ForEach-Object { $_.Value } | `
Sort-Object | `
Get-Unique | `
Out-File -FilePath "./Week12/Homework/ips-bad.tmp"


#Use a switch statement to create an IPTables or Windows firewall ruleset with the assignment from today's class that blocks the IPs.  
#From the Read-Host above, the user will type IPTables or Windows.

$var = Read-Host -Prompt "Choose Windows (W) or IPTables (I)"


switch ($var) {
    'W' {  
        (Get-Content -Path "./Week12/Homework/ips-bad.tmp") | % `
        { $_ -replace "^" , "New-NetFirewallRule -DisplayName 'Bad IP Blocker' -Direction OutBound -LocalPort Any -Protocol Any -Action Block -RemoteAddress " -replace "$" } | `
        Out-File -FilePath "./Week12/Homework/firewall.ps1"
    }

    'I' {
        (Get-Content -Path "./Week12/Homework/ips-bad.tmp") | % `
        { $_ -replace "^" , "iptables -A INPUT -s " -replace "$", " -j DROP" } | `
        Out-File -FilePath "./Week12/Homework/iptables.bash"
        
        Set-SCPItem -ComputerName '192.168.6.71' -Credential (Get-Credential david.thomsen) -Port '2222' `
        -Destination '/home/david.thomsen/' -Path './Week12/Homework/iptables.bash'

        New-SSHSession -ComputerName '192.168.6.71' -Credential (Get-Credential david.thomsen) -Port '2222'
        (Invoke-SSHCommand -index 0 "ls -la").Output
    }
}