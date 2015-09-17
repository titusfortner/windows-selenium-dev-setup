windows-selenium-dev-setup
==========================

**This repository is a fork of Jim Evans Chocolatey only implementation**

I forked this to add unsupported and more recent versions of things 

Purpose
-------
This repository provides a simple script for installing all packages on a Windows
machine to allow for running Selenium Tests. It will install the following items:

* Git
* Python 2.x
* Ruby 2.0
* Ruby 2.1
* Ruby 2.2
* Java Development Kit
* .NET Framework 3.5
* .NET Framework 4.0 (installed as a prerequisite for Chocolatey)
* Firefox
* PhantomJS
* Google Chrome
* Microsoft Edge WebDriver
* Mozilla Wires Driver
* Google Chromedriver

Usage
-----
Download and execute the script from with an elevated ("Run as Administrator) command prompt.
`go [addvs]`

The optional `addvs` parameter will also install Visual Studio Community Edition, 
if the parameter is present.
