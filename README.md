# APD-Webscrape-and-Doc-Comparison
a PowerShell script that webscrapes Army Publishing Directorate pages to get latest policy references and automates comparison with the References page from a tech manual

Instructions
How to run CheckRef script from PowerShell

1. Open PowerShell on your computer (Open search, type "powershell", select "Windows PowerShell ISE").
2. Open CheckRef script in Powershell (File / Open, navigate to ps1 script file)
3. Select all text. Click File / Run Selection.
4. Copy the body of the tech manual "References" work package into a text document and save to your local desktop in a folder called "CheckRef" as "TMreferences.txt".
5. Hit Enter on Powershell screen. Screen may appear to freeze, but give it 5 minutes (Results may take a while).
6. If any of the references from the TM do not match the data from the APD website, they will be listed on the PowerShell screen.
