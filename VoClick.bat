::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRmS+0QiLR40
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD1VWgG+GG6pDaET+NTN4MmLq04WcvA6fcHewrHu
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001
mode con: cols=70 lines=20

:s

cls
title VoClick [INTERNAL]
color 1
echo.
echo        ██▒   █▓ ▒█████   ▄████▄   ██▓     ██▓ ▄████▄   ██ ▄█▀
echo       ▓██░   █▒▒██▒  ██▒▒██▀ ▀█  ▓██▒    ▓██▒▒██▀ ▀█   ██▄█▒ 
echo        ▓██  █▒░▒██░  ██▒▒▓█    ▄ ▒██░    ▒██▒▒▓█    ▄ ▓███▄░ 
echo         ▒██ █░░▒██   ██░▒▓▓▄ ▄██▒▒██░    ░██░▒▓▓▄ ▄██▒▓██ █▄ 
echo          ▒▀█░  ░ ████▓▒░▒ ▓███▀ ░░██████▒░██░▒ ▓███▀ ░▒██▒ █▄
echo          ░ ▐░  ░ ▒░▒░▒░ ░ ░▒ ▒  ░░ ▒░▓  ░░▓  ░ ░▒ ▒  ░▒ ▒▒ ▓▒
echo          ░ ░░    ░ ▒ ▒░   ░  ▒   ░ ░ ▒  ░ ▒ ░  ░  ▒   ░ ░▒ ▒░
echo            ░░  ░ ░ ░ ▒  ░          ░ ░    ▒ ░░        ░ ░░ ░ 
echo            ░      ░ ░  ░ ░          ░  ░ ░  ░ ░      ░  ░   
echo            ░            ░                    ░               
echo.
echo.
echo.
echo              [1]FullOptimization    [2]ReturnSettings
echo.
echo.
echo.
choice /c 12 /n /m "VoClick: "

if errorlevel 2 goto option2
if errorlevel 1 goto option1

:option1
title TURNING OPTIMIZATION
cls

net session >nul 2>&1
if %errorlevel%==0 (
    goto 2
) else (
    goto 1
)

:2

echo ...
sc stop DiagTrack >nul 2>&1
sc stop WSearch >nul 2>&1
sc stop SysMain >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc config WSearch start= disabled >nul 2>&1
sc config SysMain start= disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
taskkill /f /im OneDrive.exe >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
powercfg -setactive SCHEME_MAX
ipconfig /flushdns
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
echo.
echo Optimization Turned! 
timeout /t 3 >nul
goto s



:option2
title OPTIMIZATION DELETING...

net session >nul 2>&1
if %errorlevel%==0 (
    goto 2s
) else (
    goto 1s
)

:2s

cls
echo ...
@echo off
sc config DiagTrack start= auto >nul 2>&1
sc config WSearch start= delayed-auto >nul 2>&1
sc config SysMain start= auto >nul 2>&1
sc start DiagTrack >nul 2>&1
sc start WSearch >nul 2>&1
sc start SysMain >nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /f >nul 2>&1
start %SystemRoot%\System32\OneDriveSetup.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
powercfg -setactive SCHEME_BALANCED
echo.
echo Optimization DELETED!
timeout /t 3 >nul
goto s

:1s
cls
echo [ERROR] You do NOT have administrator privileges
timeout /t 3 >nul
exit

:1
cls
echo [ERROR] You do NOT have administrator privileges
timeout /t 3 >nul
exit