@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator
rem Usage : set network name value below
set "wifi-name=Wi-Fi"
set "ethernet-name=Ethernet"

Title "MTU Changer"
echo MTU Changer
echo Press [1] to set to 1500 (default)
echo Press [2] to set to 1455 (lowest DF set)

echo Current wifi and ethernet names are : %wifi-name% and %ethernet-name%

choice /c 12 /D:1 /T:60 /m "Enter your choice: "
if %errorlevel% == 1 goto default
if %errorlevel% == 2 goto mtu1455

:default
rem set to dhcp
netsh interface ipv4 set subinterface "%ethernet-name%" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "%wifi-name%" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "%ethernet-name%" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "%wifi-name%" mtu=1500 store=persistent
ipconfig -flushdns
timeout /t 2 /nobreak >nul
goto end

:mtu1455
rem set to google public
netsh interface ipv4 set subinterface "%ethernet-name%" mtu=1455 store=persistent
netsh interface ipv4 set subinterface "%wifi-name%" mtu=1455 store=persistent
netsh interface ipv6 set subinterface "%ethernet-name%" mtu=1455 store=persistent
netsh interface ipv6 set subinterface "%wifi-name%" mtu=1455 store=persistent
ipconfig -flushdns
timeout /t 2 /nobreak >nul
goto end

:end
exit