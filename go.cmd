@echo off
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install -y git
choco install -y python2
choco install -y 7zip.commandline

choco install -y curl

setx path “%path%;C:\tools”
cd C:\tools
curl -L -O --insecure "https://bitbucket.org/jonforums/uru/downloads/uru-0.8.0-windows-x86.7z"

7za e uru-0.8.0-windows-x86.7z
C:\tools\uru_rt.exe admin install

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.3-x64.exe"
rubyinstaller-2.2.3-x64.exe /silent /dir="C:\rubies\223"

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.1.7-x64.exe"
rubyinstaller-2.1.7-x64.exe /silent /dir="C:\rubies\217"

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p647-x64.exe"
rubyinstaller-2.0.0-p647-x64.exe /silent /dir="C:\rubies\200"

choco install -y jdk7
choco install -y dotnet3.5
choco install -y firefox
choco install -y phantomjs
choco install -y google-chrome-x64

REM .NET Framework 4.0 is a prerequisite for chocolatey,
REM so is unneeded as a separate install.
REM choco install -y dotnet4.0

if [%1]==[addvs] choco install -y visualstudio2015community -packageParameters "--Features MDDCPlusPlus"

curl -L -O "http://download.microsoft.com/download/1/4/1/14156DA0-D40F-460A-B14D-1B264CA081A5/MicrosoftWebDriver.msi"
msiexec /a MicrosoftWebDriver.msi /qb TARGETDIR=C:\drivers
move "C:\drivers\Microsoft Web Driver\MicrosoftWebDriver.exe" C:\drivers
del C:\drivers\MicrosoftWebDriver.msi
rmdir "C:\drivers\Microsoft Web Driver"

curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE > temp.txt
set /p CHROMEDRIVER_VERSION=<temp.txt
curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"
7za e chromedriver_win32.zip
move chromedriver.exe C:\drivers

curl -L -O --insecure "https://github.com/jgraham/wires/releases/download/v0.5.0/wires-v0.5.0-win.zip"
7za e wires-v0.5.0-win.zip
move wires.exe C:\drivers

curl -L -O "http://selenium-release.storage.googleapis.com/2.48/IEDriverServer_Win32_2.48.0.zip"
7za e IEDriverServer_Win32_2.48.0.zip
move IEDriverServer.exe C:\drivers

setx path "%path%;C:\drivers"

mkdir C:\git
cd C:\git

echo You have to run the following manually:

echo C:\tools\uru admin add --recurse C:\rubies
echo C:\tools\uru 223

echo git clone https://github.com/SeleniumHQ/selenium.git
echo cd selenium
