#CheckRefs
#Created by Dr. Lynn M. Houston, U.S. Army Communications-Electronics Command, Logistics & Technical Support Directorate, Publication Services Division
#This Powershell script works with APDscrape.ps1 to scrape data about pamphlets, forms, technical bulletins, etc. from the Army Publishing Directorate website and compares them to the references work package of a TM, ensuring that the latest references are used.

########################
Write-Host "Script: CheckRef
           --
          Copy the body of the References WP into a notepad document.
          Save it as 'TMreferences.txt' in the Desktop/CheckRef folder." -ForegroundColor Green
          pause 2.0
########################

#User should place file "TMreferences.txt" into Checkref folder--copy and paste from TM starting with word "REFERENCES"

#After user places "TMreferences.txt" in folder, this code cleans/preps it
$folder = "$home\Desktop\Checkref"
(Get-Content $folder\TMreferences.txt) -replace '(\d)\t(\w)','$1
$2' -replace '(\-\w)\s(\w)','$1
$2' -replace 'SF\s','SF' -replace 'REFERENCES','' -replace 'SCOPE','' -replace '^This work package lists','' -replace 'DD FORM ', 'DD' -replace 'DA PAM', 'PAM' -replace 'FIELD MANUALS','' -replace 'FORMS','' -replace 'TECHNICAL  MANUALS','' -replace 'TECHNICAL BULLETINS','' -replace 'MISCELLANEOUS PUBLICATIONS','' -replace 'MISCELLANEOUS PUBLICATIONS - Continued','' -replace 'TECHNICAL MANUALS','' -replace ' - Continued','' -replace '- Continued','' | Out-file $folder\TMrefCLEAN.txt
Get-Content $folder\TMrefCLEAN.txt | select-string -pattern '\d\d' | Out-File $folder\TMrefCLEAN2.txt
Get-Content -path $folder\TMrefCLEAN2.txt | ForEach-Object {$_.Trim() -replace "\s+", " " } |  Out-File -filepath $folder\TMrefCLEAN3.txt -Encoding ascii
Get-Content $folder\TMrefCLEAN3.txt | where {$_ -ne ""} > $folder\TMrefCLEAN4.txt
(Get-Content $folder\TMrefCLEAN4.txt) -replace '\sDA','
DA' -replace '\sSF','
SF' -replace '\sCTA','
CTA' -replace '\sPAM','
PAM' -replace '\sTC','
TC' -replace '\sDD','
DD' -replace '\sTM','
TM' -replace '\sAR','
AR' | where {$_ -ne ""} > $folder\TMrefCLEAN5.txt

Get-Content $folder\TMrefCLEAN5.txt | select-string -pattern '\d\d' | Out-File $folder\TMrefCLEAN6.txt
Get-Content $folder\TMrefCLEAN6.txt | where {$_ -ne ""} > $folder\TMrefs.txt

#Clean APD references file
Get-Content -path $folder\APDreferences.txt | ForEach-Object {$_.Trim() -replace "\s+", " " } |  SC $folder\APDrefs.txt -Encoding ascii

#Delete files no longer needed
Remove-Item -path "$folder\TMrefCLEAN.txt"
Remove-Item -path "$folder\TMrefCLEAN2.txt"
Remove-Item -path "$folder\TMrefCLEAN3.txt"
Remove-Item -path "$folder\TMrefCLEAN4.txt"
Remove-Item -path "$folder\TMrefCLEAN5.txt"
Remove-Item -path "$folder\TMrefCLEAN6.txt"

#Run comparison between 2 files
Write-Host "
Checking TM references against APD website data...
" -ForegroundColor Green

$File1 = Get-Content $folder\TMrefs.txt
$File2 = Get-Content $folder\APDrefs.txt
ForEach ($Line in $File1)
{
   If ($File2 -notcontains $Line)
   {
       Write-Output "$Line"
   } 
}

Write-Host "Files listed in white above are defunct, superseded, or not indexed in this data. 
If no references appear above, then all are current. 
Double-check results at armypubs.army.mil.
NOTE: If reference title contains a number, it may show up falsely in results." -ForegroundColor Green

