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

mkdir C:\rubies

curl -L -O "﻿http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.3.0-x64.exe"
rubyinstaller-2.3.0-x64.exe /silent /dir="C:\rubies\230"

curl -L -O "﻿http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4-x64.exe"
rubyinstaller-2.2.4-x64.exe /silent /dir="C:\rubies\224"

curl -L -O "﻿http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.1.8-x64.exe"
rubyinstaller-2.1.8-x64.exe /silent /dir="C:\rubies\218"

curl -L -O "﻿http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p648-x64.exe"
rubyinstaller-2.0.0-p648-x64.exe /silent /dir="C:\rubies\200"

curl -L -O "﻿http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe"

choco install -y jdk8
choco install -y ant
choco install -y firefox
choco install -y google-chrome-x64

mkdir C:\drivers
curl -L -O --insecure "https://download.microsoft.com/download/1/4/1/14156DA0-D40F-460A-B14D-1B264CA081A5/MicrosoftWebDriver.exe"
copy MicrosoftWebDriver.exe C:\drivers\

curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE > temp.txt
set /p CHROMEDRIVER_VERSION=<temp.txt
curl -L -O "http://chromedriver.storage.googleapis.com/%CHROMEDRIVER_VERSION%/chromedriver_win32.zip"
7za e chromedriver_win32.zip
copy chromedriver.exe C:\drivers\

curl -L -O --insecure "https://github.com/mozilla/geckodriver/releases/download/v0.8.0/geckodriver-v0.8.0-win32.zip"
7za e geckodriver-v0.8.0-win32.zip
copy geckodriver.exe C:\drivers\geckodriver
copy geckodriver.exe C:\drivers\wires

curl -L -O --insecure "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-windows.zip"
7za e phantomjs-2.1.1-windows.zip
copy  phantomjs-2.1.1-windows\bin\phantomjs.exe C:\drivers\

curl -L -O "http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_Win32_2.53.1.zip"
7za e IEDriverServer_Win32_2.53.1.zip
copy IEDriverServer.exe C:\drivers\

setx path "%path%;C:\drivers"

mkdir c:\firefoxes
mkdir c:\firefoxes\esr
mkdir c:\firefoxes\developer
mkdir c:\firefoxes\beta
mkdir c:\firefoxes\nightly

setx path "%path%;c:\firefoxes\esr;c:\firefoxes\developer;c:\firefoxes\beta;c:\firefoxes\nightly"

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableESR_45.2.0_English.paf.exe"
rename FirefoxPortableESR_38.6.1_English.paf.exe firefox.exe
move firefox.exe c:\firefoxes\esr\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableTest_47.0_Beta_1_English.paf.exe"
rename FirefoxPortableTest_45.0_Beta_1_English.paf.exe firefox.exe
move firefox.exe c:\firefoxes\beta\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableDeveloper_48.0_Alpha_2_English_online.paf.exe"
rename FirefoxPortableDeveloper_48.0_Alpha_2_English_online.paf.exe firefox.exe
move firefox.exe c:\firefoxes\developer\

curl -L -O "http://downloads.sourceforge.net/portableapps/FirefoxPortableNightly_49.0_Alpha_1_Pre_English_online.paf.exe"
rename FirefoxPortableNightly_49.0_Alpha_1_Pre_English_online.paf.exe firefox.exe
move firefox.exe c:\firefoxes\nightly\

curl -L -O --insecure "https://www.jetbrains.com/ruby/download/download-thanks.html?platform=windows"

mkdir C:\git
cd C:\git

echo You have to run the following manually:

echo C:\tools\uru admin add --recurse C:\rubies
echo C:\tools\uru 223

echo DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe

echo git clone --depth 1 https://github.com/SeleniumHQ/selenium.git
echo git clone --depth 1 https://github.com/shs96c/buck
echo cd C:\git\buck
echo ant
echo cd C:\git\selenium
echo go test_rb
