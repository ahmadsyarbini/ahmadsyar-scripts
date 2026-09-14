@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
set "wifi_name=Wi-Fi"
set "eth_name=Ethernet"
Title "IPv6 switch"

echo [1] Enable IPv6
echo [2] Disable IPv6
echo [3] Do nothing
choice /c 123 /D:3 /T:60 /m "Choice: "

if %errorlevel%==1 goto ipon
if %errorlevel%==2 goto ipoff
if %errorlevel%==3 goto end

:ipon
powershell -Command "Enable-NetAdapterBinding -Name '%wifi_name%','%eth_name%' -ComponentID ms_tcpip6"
echo IPv6 enabled
timeout /t 3 >nul
goto end

:ipoff
powershell -Command "Disable-NetAdapterBinding -Name '%wifi_name%','%eth_name%' -ComponentID ms_tcpip6"
echo IPv6 disabled
timeout /t 3 >nul

:end