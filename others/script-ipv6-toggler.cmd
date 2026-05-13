@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title "IPV6 switch"
echo Press [1] Enable IPV6
echo Press [2] Disable IPV6
echo Press [3] Do nothing

choice /c 123 /D:3 /T:60 /m "Enter your choice: "
if %errorlevel% == 1 goto ipon
if %errorlevel% == 2 goto ipoff
if %errorlevel% == 3 goto end

:ipon
rem turn on ipv6
powershell -Command "Enable-NetAdapterBinding -Name 'Ethernet' -ComponentID ms_tcpip6"
echo "ipv6 enabled"
timeout /t 3 >nul
goto end

:ipoff
rem turn off ipv6
powershell -Command "Disable-NetAdapterBinding -Name 'Ethernet' -ComponentID ms_tcpip6"
echo "ipv6 disabled"
timeout /t 3 >nul
goto end

:end
exit