@echo off
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install -y git
choco install -y python2
choco install -y ruby
choco install -y jdk7
choco install -y dotnet3.5
choco install -y firefox
choco install -y phantomjs
choco install -y google-chrome-x64
choco install -y curl

REM .NET Framework 4.0 is a prerequisite for chocolatey,
REM so is unneeded as a separate install.
REM choco install -y dotnet4.0

if [%1]==[addvs] choco install -y visualstudio2015community -packageParameters "--Features MDDCPlusPlus"

curl -L -O "http://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.msi"
msiexec MicrosoftWebDriver.msi /qb TARGETDIR=C:\drivers
move “C:\drivers\Microsoft Web Driver\MicrosoftWebDriver.exe” C:\drivers
del C:\drivers\MicrosoftWebDriver.msi
rmdir “C:\drivers\Microsoft Web Driver”

curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE > temp.txt
set /p CHROMDERIVER_VERSION=<temp.txt
curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"
jar xf chromedriver_win32.zip
move chromedriver.exe C:\drivers

curl -L -O "https://github.com/jgraham/wires/releases/download/0.3.0/wires-0.3.0-windows.zip"
jar xf wires-0.3.0-windows.zip
move wires.exe C:\drivers

curl -L -O "http://selenium-release.storage.googleapis.com/2.47/IEDriverServer_x64_2.47.0.zip"

setx path “%path%C:\drivers”

git clone —depth 1 https://github.com/SeleniumHQ/selenium.git

pause > nul
