@echo off
setlocal
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator

rem info check with openrgb cli what kind of mode does your rgb device have

schtasks /create /tn "openrgb-lightsoff" /tr "\"C:\Program Files\OpenRGB\OpenRGB.exe\" --mode static --color 000000" /sc onlogon /rl highest /f

echo Scheduled task "openrgb-lightsoff" created successfully.
timeout /t 3 > nul