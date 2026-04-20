@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title "Hotspot TTL switcher"
echo Press [1] to turn on TTL to 65
echo Press [2] to set to default windows
echo Press [3] to exit
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
netsh int ipv4 set glob defaultcurhoplimit=128
netsh int ipv6 set glob defaultcurhoplimit=128
timeout /t 3 /nobreak >nul
goto end

:turnon
netsh int ipv4 set glob defaultcurhoplimit=65
netsh int ipv6 set glob defaultcurhoplimit=65
timeout /t 3 /nobreak >nul
goto end

:end
exit