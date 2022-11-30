#create cmdline parameters to copy a file and 
#place into an evidence dir

param(

[Parameter(Mandatory = $true)]
[int]$reportNo,

[Parameter(Mandatory = $true)]
[String]$filePath

)

#create a dir with the report number

$reportDir = "rpt_$reportNo"

#creating a new dir

mkdir $reportDir

#copy file into new dir
Copy-Item $filePath $reportDir