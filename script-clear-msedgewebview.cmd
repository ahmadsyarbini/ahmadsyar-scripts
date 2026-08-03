@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem template
rem taskkill /IM "whatsapp.exe" /T /F
rem template

taskkill /IM "msedgewebview2.exe" /T /F

timeout /t 1 /nobreak >nul