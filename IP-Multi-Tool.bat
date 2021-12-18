@echo off
Rem Paste this code into notepad and save it as IP-Multi-Tool.bat
Rem LoL
Rem DDDOOOOSSSS
Rem si papi
Rem Option 9 opens the last API response in a text document. (Works with options 1,2,5,6,7)
title IP Multi Tool
color 0A
mode con lines=22 cols=70
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
set action=version
set localversion=1.6.0.0
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo  Checking for updates. . .
echo sUrl = "https://api.ddosfilter.net/ipmultitoolversion.txt" > %temp%\%webclient%.vbs
goto apirequest
:checkversion
set /p version=<"%temp%\response.txt"
if %localversion% EQU %version% del "%temp%\response.txt" /f /q /s >nul & goto menu
cls
echo.
echo  An update is available for IP Multi Tool^^!
echo.
echo.  New version: %version%
echo.
echo   Your version: %localversion%
echo.
set /p dlupdate= Would you like to download the update? y/n:
if '%dlupdate%'=='y' (
cls
echo.
echo  Downloading to Downloads folder. . .
echo.
echo sUrl = "https://pastebin.com/raw/WbgYDjGS" > %temp%\%webclient%.vbs
goto apirequest
:update
find "6Ip5ithetropU1lSpiwRlcrLN5ro6er7" %temp%\response.txt >nul
if %errorlevel% NEQ 0 (
echo  Error downloading update^^!
echo.
pause
goto menu
)
move %temp%\response.txt C:\Users\%username%\Downloads\IP-Multi-Tool.bat >nul
set dlupdate=0
echo  Starting updated version. . .
ping 127.0.0.1 -n 2 -w 1000 >nul
start C:\Users\%username%\Downloads\IP-Multi-Tool.bat
exit
)
:menu
set ip=127.0.0.1
set action=0
mode con lines=22 cols=70
cls
echo  IP-Multi-Tool v%localversion%                         
echo                                  Menu
echo.
echo                            View your IP: (1)
echo.
echo                            Lookup an IP: (2)
echo.
echo                             Ping an IP: (3)
echo.
echo                          TraceRoute an IP: (4)
echo.
echo                           PortScan an IP: (5)
echo.
echo                         Find a websites IP: (6)
echo.
echo                            WhoIs Lookup: (7)
echo.
echo                              NSLookup: (8)
echo.
echo                         View response text: (9)
echo.
:action
set /p action=Type your choice. 1,2,3,4,5,6,7,8,9:
if '%action%'=='1' echo sUrl = "https://api.ddosfilter.net/IPLookupAPI.php" > %temp%\%webclient%.vbs & echo sRequest = "key=c8acHeruFreSehlxOxObrasw1fremedA" >> %temp%\%webclient%.vbs & goto apirequest
if '%action%'=='2' goto iplookup
if '%action%'=='3' goto ipping
if '%action%'=='4' goto traceroute
if '%action%'=='5' goto portscan
if '%action%'=='6' goto cfresolver
if '%action%'=='7' goto whois
if '%action%'=='8' goto nslookup
if '%action%'=='9' goto opentext
echo.
echo Please enter a valid choice.
echo.
goto action
:apirequest
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
if %action% NEQ version (
cls
echo.
echo  Waiting for API response. . .
)
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "POST", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDir = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDir) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 12 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
tasklist | find "wscript.exe" >nul
if %errorlevel% EQU 0 taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo  Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
del "%temp%\%webclient%.vbs" /f /q /s >nul
if %action% EQU version if '%dlupdate%'=='y' goto update
find "banned" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto banned
find "One more step" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto cbanned
find "Web server is down" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
find "Connection timed out" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
find "404 Not Found" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
goto verified
:banned
cls
echo.
echo  Error: You have been banned for abuse.
ping 127.0.0.1 -n 4 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
exit
:cbanned
cls
echo.
echo  Error: Your IP has been blocked for security purposes.
echo  Contact @DDoS_Filter on instagram for help.
echo  Sorry for any inconvinience.
echo  If you are using a VPN and have received this error message,
echo  turn off the VPN, and try again.
ping 127.0.0.1 -n 8 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
exit
:offline
cls
echo.
echo  Error: The API is offline.
ping 127.0.0.1 -n 4 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
goto menu
:verified
set "data=findstr /R /N "^^" %temp%\response.txt | find /C ":"",
for /f %%i in ('!data!') do set lines=%%i
if %lines% LSS 10 (
set /a lines=20
) else (
set /a lines=%lines% + 3
)
if '%action%'=='version' goto checkversion
if '%action%'=='1' goto parseiplookup
if '%action%'=='2' goto parseiplookup
if '%action%'=='5' goto parsepscan
if '%action%'=='6' goto parsecfresolver
if '%action%'=='7' goto parsewhois
goto menu
:iplookup
cls
echo.
echo                          Type an IP to lookup
echo.
set /p ip=IP:
echo sUrl = "https://api.ddosfilter.net/IPLookupAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=c8acHeruFreSehlxOxObrasw1fremedA&ip=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parseiplookup
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i ":" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:ipping
rem Inteli-Ping by @DDoS_Filter
set /a replies=0
set /a timeouts=0
cls
echo.
echo                       Type an IP or URL to ping
echo.
set /p ip=Host:
mode con lines=8 cols=30
:ping
ping %ip% -n 1 | find "Reply" >nul
if %errorlevel% EQU 1 (
set /a timeouts=%timeouts% + 1
set status=Host is offline
) else (
set /a replies=%replies% + 1
set status=Host is online
)
cls
echo Pinging %ip%
echo.
echo  %status%^^!
echo.
echo  Successful Replies: %replies%
echo.
echo  Requests Timed Out: %timeouts%
ping 127.0.0.1 -n 2 -w 1000 >nul
goto ping
:traceroute
cls
echo.
echo                    Type an IP or URL to trace route
echo.
set /p ip=Host:
tracert %ip%
echo.
pause
goto menu
:portscan
cls
echo.
echo                        Type a host to port scan
echo.
set /p ip=Host:
echo sUrl = "https://api.ddosfilter.net/PortScanAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=zlSOgLsWequm8mUyagld7ibrOgOflniq&ip=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsepscan
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i "Results Port Error" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:cfresolver
cls
echo.
echo                         Type a domain to resolve
echo.
set /p ip=Domain:
echo sUrl = "https://api.ddosfilter.net/CFResolverAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=c8acHeruFreSehlxOxObrasw1fremedA&host=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsecfresolver
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i "IP Error" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:whois
cls
echo.
echo                       Type a host to WhoIs lookup
echo.
set /p ip=Host:
echo sUrl = "https://api.ddosfilter.net/WhoIsAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=spuqlc74preve03aPHudRek8sPu9r8Co&host=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsewhois
mode con lines=%lines% cols=100
cls
echo.
for /f "delims=     " %%i in ('findstr /i ":" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:nslookup
cls
echo.
echo                    Type an IP or Domain to NSLookup
echo.
set /p ip=Host:
cls
echo.
echo Name Server Look up using Cloudflare DNS. . .
echo.
nslookup %ip% 1.1.1.1
echo.
pause
goto menu
:opentext
if exist "%temp%\response.txt" start %temp%/response.txt
goto menu
Rem Coded by DSTAT. Instagram: @DDoS_Filter
Rem http://ddosfilter.net/
Rem https://pastebin.com/WbgYDjGS