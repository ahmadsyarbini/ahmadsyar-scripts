@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator
rem Usage : set network name value below
set "wifi-name=Wi-Fi"
set "ethernet-name=Ethernet"

Title "DNS Switch"
echo DNS Server Switch
echo Press [1] to set to DHCP (default)
echo Press [2] to set to Google Public 8.8.8.8
echo Press [3] to set to Cloudflare antimalware 1.1.1.2 (but not adblock)
echo Press [4] to set to Adguard (80 percent adblocked, recommended)
echo Press [5] to set to Blissdns (94 percent adblocked, but high latency)
echo Press [6] to set to Tiarapp (Too much false positive)
echo Press [7] to set to Mullvad (New)

echo Current wifi and ethernet names are : %wifi-name% and %ethernet-name%

choice /c 1234567 /D:1 /T:60 /m "Enter your choice: "
if %errorlevel% == 1 goto dhcp
if %errorlevel% == 2 goto google
if %errorlevel% == 3 goto cloudflare
if %errorlevel% == 4 goto adguard
if %errorlevel% == 5 goto blissdns
if %errorlevel% == 6 goto tiarapp
if %errorlevel% == 7 goto mullvad

:dhcp
echo set to dhcp
netsh interface ipv4 set dnsservers "%ethernet-name%" source=dhcp
netsh interface ipv6 set dnsservers "%ethernet-name%" source=dhcp
netsh interface ipv4 set dnsservers "%wifi-name%" source=dhcp
netsh interface ipv6 set dnsservers "%wifi-name%" source=dhcp
ipconfig -flushdns
goto end

:google
echo set to google public
netsh interface ipv4 set dnsservers "%ethernet-name%" static 8.8.8.8
netsh interface ipv4 add dnsservers "%ethernet-name%" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "%ethernet-name%" 2001:4860:4860::8844 index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 8.8.8.8
netsh interface ipv4 add dnsservers "%wifi-name%" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "%wifi-name%" 2001:4860:4860::8844 index=2
ipconfig -flushdns
goto end

:cloudflare
echo set to cloudflare antimalware (but no adblock)
netsh interface ipv4 set dnsservers "%ethernet-name%" static 1.1.1.2
netsh interface ipv4 add dnsservers "%ethernet-name%" 1.0.0.2 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2606:4700:4700::1112
netsh interface ipv6 add dnsservers "%ethernet-name%" 2606:4700:4700::1002 index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 1.1.1.2
netsh interface ipv4 add dnsservers "%wifi-name%" 1.0.0.2 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2606:4700:4700::1112
netsh interface ipv6 add dnsservers "%wifi-name%" 2606:4700:4700::1002 index=2
ipconfig -flushdns
goto end

:adguard
echo set to adguard
netsh interface ipv4 set dnsservers "%ethernet-name%" static 94.140.14.14
netsh interface ipv4 add dnsservers "%ethernet-name%" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "%ethernet-name%" 2a10:50c0::ad2:ff index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 94.140.14.14
netsh interface ipv4 add dnsservers "%wifi-name%" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "%wifi-name%" 2a10:50c0::ad2:ff index=2
ipconfig -flushdns
goto end

:blissdns
echo set to blissdns
netsh interface ipv4 set dnsservers "%ethernet-name%" static 173.255.201.254
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2600:3c00::f03c:93ff:feca:d2be
netsh interface ipv4 set dnsservers "%wifi-name%" static 173.255.201.254
netsh interface ipv6 set dnsservers "%wifi-name%" static 2600:3c00::f03c:93ff:feca:d2be
ipconfig -flushdns
goto end

:tiarapp
echo set to tiarapp
netsh interface ipv4 set dnsservers "%ethernet-name%" static 174.138.21.128
netsh interface ipv4 add dnsservers "%ethernet-name%" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2400:6180:0:d0::5f6e:4001
netsh interface ipv4 set dnsservers "%wifi-name%" static 174.138.21.128
netsh interface ipv4 add dnsservers "%wifi-name%" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2400:6180:0:d0::5f6e:4001
ipconfig -flushdns
goto end

:mullvad
echo set to mullvad
netsh interface ipv4 set dnsservers "%ethernet-name%" static 194.242.2.4
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2a07:e340::4
netsh interface ipv4 set dnsservers "%wifi-name%" static 194.242.2.4
netsh interface ipv6 set dnsservers "%wifi-name%" static 2a07:e340::4
ipconfig -flushdns
goto end

:end
echo .
echo DNS change has been applied
echo .
timeout /t 3 /nobreak >nul
exit