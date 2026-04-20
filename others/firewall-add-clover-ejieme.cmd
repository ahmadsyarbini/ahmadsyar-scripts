@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
::safely deletes duplicate if any
netsh advfirewall firewall delete rule name="Block Clover.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block Clover.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block CloverAss.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block CloverAss.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block ClvClient.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block ClvClient.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block ClvRate.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block ClvRate.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block ClvUtility.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block ClvUtility.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block SoftUpd.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block SoftUpd.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block Uninst.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block Uninst.exe Outbound" dir=out
netsh advfirewall firewall delete rule name="Block UserPage.exe Inbound" dir=in
netsh advfirewall firewall delete rule name="Block UserPage.exe Outbound" dir=out
::Add back
netsh advfirewall firewall add rule name="Block Clover.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\Clover.exe" enable=yes
netsh advfirewall firewall add rule name="Block Clover.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\Clover.exe" enable=yes
netsh advfirewall firewall add rule name="Block CloverAss.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\CloverAss.exe" enable=yes
netsh advfirewall firewall add rule name="Block CloverAss.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\CloverAss.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvClient.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\ClvClient.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvClient.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\ClvClient.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvRate.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\ClvRate.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvRate.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\ClvRate.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvUtility.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\ClvUtility.exe" enable=yes
netsh advfirewall firewall add rule name="Block ClvUtility.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\ClvUtility.exe" enable=yes
netsh advfirewall firewall add rule name="Block SoftUpd.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\SoftUpd.exe" enable=yes
netsh advfirewall firewall add rule name="Block SoftUpd.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\SoftUpd.exe" enable=yes
netsh advfirewall firewall add rule name="Block Uninst.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\Uninst.exe" enable=yes
netsh advfirewall firewall add rule name="Block Uninst.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\Uninst.exe" enable=yes
netsh advfirewall firewall add rule name="Block UserPage.exe Inbound" dir=in action=block program="C:\Program Files (x86)\Clover\UserPage.exe" enable=yes
netsh advfirewall firewall add rule name="Block UserPage.exe Outbound" dir=out action=block program="C:\Program Files (x86)\Clover\UserPage.exe" enable=yes

::excess files renamer

echo exiting explorer and clover for safety...
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im clover.exe >nul 2>&1
timeout /t 2 /nobreak >nul
cd %temp%
del clover-setup.exe
cd "C:\Program Files (x86)\Clover"
ren "CloverAss.exe" "CloverAss.exe.bak"
ren "ClvClient.exe" "ClvClient.exe.bak"
ren "ClvRate.exe" "ClvRate.exe.bak"
ren "ClvUtility.exe" "ClvUtility.exe.bak"
ren "SoftUpd.exe" "SoftUpd.exe.bak"
ren "UserPage.exe" "UserPage.exe.bak"
echo restarting explorer
start explorer.exe

endlocal
timeout /t 5 /nobreak >nul