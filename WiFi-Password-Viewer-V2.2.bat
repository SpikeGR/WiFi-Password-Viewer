@echo off
title WiFi Password Viewer V2.2

:checkforupdates
cd Updater
call Updater.bat

:start
cls
echo.
echo  WiFi Password Viewer V%localtwo%
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
goto getpass

:getpass
cls
echo.
echo  WiFi Password Viewer V%localtwo%
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
echo.
echo WARNING: "WiFi Password Viewer" DOES NOT steal/crack the password.
echo           This program finds the password from the saved WiFi which you already connected before!
echo.
timeout 5 > nul
echo Below you can see all the saved WiFi.
echo If your WiFi is not listed below, then this program can't show you the password!
echo.
timeout 3 > nul
echo.
echo ----WiFi List----
echo.
netsh wlan show profiles | findstr /R /C:"[ ]:[ ]"
echo.
echo ----End of List----
echo.
echo If the list is empty, then this program won't work.
echo.
set /p ssid="Enter SSID Name: "
cls
echo.
echo  WiFi Password Viewer V%localtwo%
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
echo.
echo SSID Name:
netsh wlan show profile name="%ssid%" key=clear | findstr /a:4 "name"
echo.
echo Security mode:
netsh wlan show profile name="%ssid%" key=clear | findstr /a:4  "Authentication"
echo.
echo WiFi Password:
netsh wlan show profile name="%ssid%" key=clear | findstr /a:4 "Key"
echo.
echo If results are empty,  run this program as Administrator and check if you entered SSID name correctly.
pause>nul
goto start

:end