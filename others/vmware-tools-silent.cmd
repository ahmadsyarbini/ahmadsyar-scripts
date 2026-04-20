@echo off
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
"D:\setup.exe" /s /v"/qb ADDLOCAL=ALL REBOOT=Force"
timeout /t 5 /nobreak >nul