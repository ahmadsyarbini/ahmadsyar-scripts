@echo off
setlocal
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
:: OpenRGB profile folder
set "PROFILE_DIR=%appdata%\OpenRGB"
if not exist "%PROFILE_DIR%" mkdir "%PROFILE_DIR%"

:: Copy the profile from the same folder as this script
rem robocopy "%userprofile%\My Drive\Documents\Tech\set-once" "%PROFILE_DIR%" "allblack.orp"
:: Create scheduled task
rem schtasks /create /tn "openrgb-lightsoff" /tr "\"C:\Program Files\OpenRGB\OpenRGB.exe\" --profile \"allblack\"" /sc onlogon /rl highest /f

schtasks /create /tn "openrgb-lightsoff" /tr "\"C:\Program Files\OpenRGB\OpenRGB.exe\" --mode off" /sc onlogon /rl highest /f

echo Scheduled task "openrgb-lightsoff" created successfully.
timeout /t 3 > nul