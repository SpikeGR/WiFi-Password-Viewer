@echo off
title WiFi Password Viewer V2.0

:checkforupdates
echo.
echo  WiFi Password Viewer V2.0
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
echo.
timeout 3 > nul
echo Checking for Updates...
timeout 5 > nul
set local=2.0
set localtwo=%local%
set link=https://pastebin.com/raw/rJkzYy7S

:check
IF EXIST "version.bat" DEL /Q "version.bat"
goto :download
pause

:download
download %link% version.bat
CALL "version.bat"
goto check-2

:check-2
IF "%local%"=="%localtwo%" goto :yes
IF NOT "%local%"=="%localtwo%" goto :no

:yes
cls
echo.
echo  WiFi Password Viewer V%localtwo%
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
echo.
echo  No updates found.
echo  You are using the latest version!
timeout 4 > nul
echo  WiFi Password Viewer will now start.
goto start

:no
cls
echo.
echo  WiFi Password Viewer V%localtwo%
echo --------------------------------
echo  Created by SpikeGR
echo  YouTube: https://youtube.com/spikegreece
echo --------------------------------
echo.
echo New Update found!
echo.
echo  Version: %local% is available!
echo  You currently have version %localtwo% installed
echo.
echo  Do you want to download the new Update?
echo  1 - Yes, download the update now.
echo  2 - No, maybe later.
echo.
set /p num="Enter Number: "
if %num%==1 goto downloadupdate
if %num%==2 goto start

:downloadupdate
echo Your browser will now open and download the latest update!
echo WiFi Password Viewer will close automatically.
timeout 5 > nul
start "" https://rebrand.ly/WiFiPasswordViewer
exit

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
timeout 3 > nul
echo.
netsh wlan show profiles | findstr /R /C:"[ ]:[ ]"
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