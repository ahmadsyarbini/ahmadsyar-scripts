@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem README Vmware tool quick silent installer for windows 11 and 10.
rem usage : Disconnect OS iso first, then mount the vmware tools iso using the "install vmware tools" menu

"D:\setup.exe" /s /v"/qb ADDLOCAL=ALL REBOOT=Force"
timeout /t 5 /nobreak >nul