# Sample Dockerfile

# Indicates that the windowsservercore image will be used as the base image.
FROM microsoft/windowsservercore

# Metadata indicating an image maintainer.
MAINTAINER taylortwbrown

# Setup Plex.
RUN powershell Get-ChildItem "$Env:SystemRoot\Servicing\Packages\*Media*.mum" | ForEach-Object { (Get-Content $_) -replace 'required','no' | Set-Content $_}
RUN Install-WindowsFeature Server-Media-Foundation
RUN (New-Object Net.WebClient).DownloadFile('https://downloads.plex.tv/plex-media-server/1.12.3.4973-215c28d86/Plex-Media-Server-1.12.3.4973-215c28d86.exe', '\plex.exe')
RUN .\plex.exe /quiet
RUN del .\plex.exe
RUN powershell Clear-RecycleBin
RUN start "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"

# Sets a command or process that will run each time a container is run from the new image.
CMD [ "cmd" ]

