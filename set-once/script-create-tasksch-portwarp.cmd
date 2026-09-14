@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
schtasks /create /tn "Portwarp-Connect" /tr "\"%USERPROFILE%\pwrp\pwrp.exe\" connect --all --detach" /sc onlogon /rl limited /f
echo portwarp task created
timeout /t 4 /nobreak >nul