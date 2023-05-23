#save output to csv
Get-Service | Where-Object {$_.Status -eq "Running"} | Export-Csv -Path `
C:\Users\dthom\Documents\SYS-320\Week10\Homework\Outputs.csv