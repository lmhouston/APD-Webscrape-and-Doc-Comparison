
#APD scrape

#Created by Dr. Lynn M. Houston, U.S. Army Communications-Electronics Command, Logistics & Technical Support Directorate, Publication Services Division
#This Powershell script works with CheckRef.ps1 to scrape data about pamphlets, forms, technical bulletins, etc. from the Army Publishing Directorate website and compares them to the references work package of a TM, ensuring that the latest references are used.

#Scrape APD site for latest references--this could take about an hour to run
$folder = "$home\Desktop\Checkref"
New-Item -Path $folder -Name "APDreferences.txt" -Itemtype file

#Get Tech Bulletins
$TB1 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TB.aspx"
$content = $TB1.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Tech Bulletins Engineering
$TB2 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TB_Admin.aspx"
$content = $TB2.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Tech Bulletin Medical
$TB3 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TB_Cal.aspx"
$content = $TB3.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DA Pamphlets
$DP = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/PAM.aspx"
$content = $DP.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Army Regulations
$AR = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/AR.aspx"
$content = $AR.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (1-8)
$TM1 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_1_8.aspx"
$content = $TM1.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (9)
$TM2 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_9.aspx"
$content = $TM2.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (10)
$TM3 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_10.aspx"
$content = $TM3.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (11-4)
$TM4 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_11_4.aspx"
$content = $TM4.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (11-5)
$TM5 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_11_5.aspx"
$content = $TM5.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (11-6)
$TM6 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_11_6_7.aspx"
$content = $TM6.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs (>=14)
$TM7 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_14_750.aspx"
$content = $TM7.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs Engineering
$TM8 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_Admin.aspx"
$content = $TM8.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get TMs Medical
$TM9 = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TM_Cal.aspx"
$content = $TM9.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Common Table of Allowances
$CTA = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/CTA.aspx"
$content = $CTA.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Field Manuals
$FM = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/FM.aspx"
$content = $FM.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Army Doctrine Pubs
$ADP = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/ADP.aspx"
$content = $ADP.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get Training Circulars
$TC = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/TC.aspx"
$content = $TC.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DA Forms
$DA = Invoke-WebRequest "https://armypubs.army.mil/ProductMaps/PubForm/DAForm.aspx"
$content = $DA.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (1-499)
$DD1 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd0001_0499/"
$content = $DD1.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (500-999)
$DD2 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd0500_0999/"
$content = $DD2.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (1000-1499)
$DD3 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd1000_1499/"
$content = $DD3.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (1500-1999)
$DD4 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd1500_1999/"
$content = $DD4.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (2000-2499)
$DD5 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd2000_2499/"
$content = $DD5.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (2500-2999)
$DD6 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd2500_2999/"
$content = $DD6.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get DD Forms (3000-3499)
$DD7 = Invoke-WebRequest "https://www.esd.whs.mil/Directives/forms/dd3000_3499/"
$content = $DD7.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

#Get SF Forms
$SF = Invoke-WebRequest "https://www.gsa.gov/reference/forms#"
$content = $SF.ParsedHtml.all.tags("td") | ForEach-Object -MemberName innertext
$content | Add-Content $folder\APDreferences.txt

