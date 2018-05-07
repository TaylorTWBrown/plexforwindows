# Plex for Windows
# Unofficial build by Taylor Brown, for testing.
# Pulls Windows Server, Plex, and makes them work together.

# Indicates that the windowsservercore image will be used as the base image.
FROM microsoft/windowsservercore

# Metadata indicating an image maintainer.
MAINTAINER taylortwbrown

# Networking stuff.
EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp

# Setup Plex.
ADD Installer.ps1 Installer.ps1
RUN powershell -File Installer.ps1 -ExecutionPolicy ByPass

# Sets a command or process that will run each time a container is run from the new image.
CMD start "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"

