@echo off
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install -y git
choco install -y python2
choco install -y 7zip.commandline
choco install -y curl

setx path “%path%;C:\tools”
cd C:\tools
curl -L -O --insecure "https://bitbucket.org/jonforums/uru/downloads/uru-0.8.2-windows-x86.7z"

7za e uru-0.8.2-windows-x86.7z
C:\tools\uru_rt.exe admin install

mkdir C:\rubies

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.3.1-x64.exe"
rubyinstaller-2.3.1-x64.exe /silent /dir="C:\rubies\231"

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.5-x64.exe"
rubyinstaller-2.2.5-x64.exe /silent /dir="C:\rubies\225"

curl -L -O "http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe"

choco install -y jdk8
choco install -y ant
choco install -y firefox
choco install -y firefoxesr
choco install -y google-chrome-x64

mkdir C:\drivers
curl -L -O --insecure "https://download.microsoft.com/download/1/4/1/14156DA0-D40F-460A-B14D-1B264CA081A5/MicrosoftWebDriver.exe"
copy MicrosoftWebDriver.exe C:\drivers\

curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE > temp.txt
set /p CHROMEDRIVER_VERSION=<temp.txt
curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"
7za e chromedriver_win32.zip
copy chromedriver.exe C:\drivers\

curl -L -O --insecure "https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-win64.zip"
7za e geckodriver-v0.11.1-win64.zip
copy geckodriver.exe C:\drivers\geckodriver

curl -L -O --insecure "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-windows.zip"
7za e phantomjs-2.1.1-windows.zip
copy  phantomjs-2.1.1-windows\bin\phantomjs.exe C:\drivers\

setx path "%path%;C:\drivers"

curl -L -O "http://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-52.0a1.en-US.win64.installer.exe"
firefox-52.0a1.en-US.win64.installer.exe /silent

choco install rubymine

mkdir C:\git
cd C:\git

echo You have to run the following manually:
echo C:\tools\uru admin add --recurse C:\rubies
echo C:\tools\uru 225

echo DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe

echo git clone --depth 1 https://github.com/SeleniumHQ/selenium.git
echo cd C:\git\selenium
echo copy C:\git\selenium\cpp\prebuilt\Win32\Release\IEDriverServer.exe C:\drivers\
echo go test_rb
