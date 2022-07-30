@echo off
title Fix for Wireless Ping Spikes (self.GlobalOffensive)
echo submitted by Clyq, bat by Ment-0
echo ------------------------------------------------------------------
echo Stop your Wireless Card from searching nearby networks and
echo updating your signal quality when you're not asking it to, 
echo which is what is causing the spikes.
echo ------------------------------------------------------------------
echo You will need to turn it back on if you disconnect or need to be 
echo able to find nearby networks again. 
echo Good Luck!
echo ------------------------------------------------------------------
pause
:MENU
cls
echo ------------------------------------------------------------------
echo -------------------Fix for Wireless Ping Spikes-------------------
echo ------------------------------------------------------------------
echo Option 1: Disable searching for networks and updating quality.
echo Option 2: Enable searching for networks and updating quality.
echo Option 3: Exit.
SET /P M=Type 1, 2 OR 3 then press ENTER:
IF %M%==1 GOTO DISABLE
IF %M%==2 GOTO ENABLE
IF %M%==3 GOTO END
:DISABLE
cls
netsh wlan show settings
echo.
echo The last line should be like: Auto configuration logic is 
echo enabled on interface "WiFi"
echo.
echo If so, type what is says after interface.
echo EXAMPLE if interface="WiFi" then you type: WiFi
SET /P input=Type here:
netsh wlan set autoconfig enabled=no interface="%INPUT%"
pause
GOTO MENU
:ENABLE
cls
netsh wlan show settings
echo.
echo The last line should be like: Auto configuration logic is 
echo disabled on interface "WiFi"
echo.
echo If so, type what is says after interface.
echo EXAMPLE if interface="WiFi" then you type: WiFi
SET /P input=Type here:
netsh wlan set autoconfig enabled=yes interface="%INPUT%"
pause
GOTO MENU
:END
exit
