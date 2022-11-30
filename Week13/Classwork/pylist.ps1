# list the files in a dir and 
# list all files and get full path

#Get-ChildItem -Recurse -Include *.docx, *.pdf, *.txt -Path .\Week13\Classwork\Documents `
#|Select-Object FullName


#Get-ChildItem -Recurse -Include *.docx, *.pdf, *.txt -Path .\Week13\Classwork\Documents `
#|Export-Csv -Path .\Week13\Classwork\files.csv


# import csv file

$filelist = Import-Csv -Path .\Week13\Classwork\files.csv -Header FullName


# loop through results

foreach ($f in $filelist) {

    Get-ChildItem -path $f.FullName

}


