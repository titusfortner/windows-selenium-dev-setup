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
choco install -y google-chrome-x64

curl -L -O --insecure "https://download.microsoft.com/download/1/4/1/14156DA0-D40F-460A-B14D-1B264CA081A5/MicrosoftWebDriver.exe"
move MicrosoftWebDriver.exe C:\drivers

curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE > temp.txt
set /p CHROMEDRIVER_VERSION=<temp.txt
curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"
7za e chromedriver_win32.zip
move chromedriver.exe C:\drivers

curl -L -O --insecure "https://github.com/jgraham/wires/releases/download/v0.6.2/wires-0.6.2-win.zip"
7za e wires-0.6.2-win.zip
move wires.exe C:\drivers

curl -L -O "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-windows.zip"
7za e phantomjs-2.1.1-windows.zip
move  phantomjs-2.1.1-windows/bin/phantomjs.exe C:\drivers

curl -L -O "http://selenium-release.storage.googleapis.com/2.52/IEDriverServer_x64_2.52.0.zip"
7za e IEDriverServer_x64_2.52.0.zip
rename IEDriverServer.exe IEDriverServer64.exe
move IEDriverServer64.exe C:\drivers

curl -L -O "http://selenium-release.storage.googleapis.com/2.52/IEDriverServer_Win32_2.52.0.zip"
7za e IEDriverServer_Win32_2.52.0.zip
move IEDriverServer.exe C:\drivers

setx path "%path%;C:\drivers"

mkdir c:\firefoxes
mkdir c:\firefox\esr
mkdir c:\firefox\developer
mkdir c:\firefox\beta
mkdir c:\firefox\nightly
setx path "%path%;c:\firefoxes\esr;c:\firefoxes\developer;c:\firefoxes\beta;c:\firefoxes\nightly"

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableESR_38.6.1_English.paf.exe"
rename FirefoxPortableESR_38.6.1_English.paf.exe firefox.exe
move firefox.exe c:\firefox\esr\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableTest_45.0_Beta_1_English.paf.exe"
rename FirefoxPortableTest_45.0_Beta_1_English.paf.exe firefox.exe
move firefox.exe c:\firefox\beta\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableDeveloper_46.0_Alpha_2_English_online.paf.exe"
rename FirefoxPortableDeveloper_46.0_Alpha_2_English_online.paf.exe firefox.exe
move firefox.exe c:\firefox\developer\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableNightly64_47.0_Alpha_1_Pre_English_online.paf.exe"
rename FirefoxPortableNightly64_47.0_Alpha_1_Pre_English_online.paf.exe firefox.exe
move firefox.exe c:\firefox\nightly\

mkdir C:\git
cd C:\git

echo You have to run the following manually:

echo C:\tools\uru admin add --recurse C:\rubies
echo C:\tools\uru 223

echo git clone https://github.com/SeleniumHQ/selenium.git
echo cd selenium
