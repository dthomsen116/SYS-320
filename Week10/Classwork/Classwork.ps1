#Get a list of running processes

#Get list of members
#Get-Process | Get-Member

# get list of processes; name, id, path
#Get-Process | Select-Object ProcessName, Id, Path

$outputpath = "C:\Users\dthom\Documents\SYS-320\Week10\Classwork\Outputs.csv"

$outputpath2 = "C:\Users\dthom\Documents\SYS-320\Week10\Classwork\RunningOutputs.csv"


# save output to csv
Get-Process | Select-Object ProcessName, Id, Path | Export-Csv -Path `
C:\Users\dthom\Documents\SYS-320\Week10\Classwork\Outputs.csv

# system services and properties
Get-Service | Select-Object Status, Name, DisplayName, BinaryPathName | export-csv -Path `
$outputpath

#get a list of running services
Get-Service | Where-Object {$_.Status -eq "Running"}


# Check to see if the file exists
# if (Test-Path $outputpath ) {

#     Write-Host -BackgroundColor "blue" -ForegroundColor "white" "services files was created"
# }

# else {    

# Write-Host -BackgroundColor "red" -ForegroundColor "white" "services files was not created"
# }
