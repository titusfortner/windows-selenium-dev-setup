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

set CHROMEDRIVER_CMD=curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE
%CHROMEDRIVER_CMD% > temp.txt
set /p CHROMDERIVER_VERSION=<temp.txt

curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"

jar xf chromedriver_win32.zip
mkdir C:\drivers
move chromedriver.exe drivers
setx path “%path%C:\drivers”

git clone —depth 1 https://github.com/SeleniumHQ/selenium.git
