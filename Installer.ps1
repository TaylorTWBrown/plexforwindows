Get-ChildItem "$Env:SystemRoot\Servicing\Packages\*Media*.mum" | ForEach-Object { (Get-Content $_) -replace 'required','no' | Set-Content $_}
Install-WindowsFeature Server-Media-Foundation
(New-Object Net.WebClient).DownloadFile('https://downloads.plex.tv/plex-media-server/1.12.3.4973-215c28d86/Plex-Media-Server-1.12.3.4973-215c28d86.exe', '\plex.exe')
.\plex.exe /quiet
del .\plex.exe
powershell Clear-RecycleBin