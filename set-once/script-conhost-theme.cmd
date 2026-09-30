@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
echo Applying console configuration...

reg add "HKCU\Console" /v FaceName /t REG_SZ /d "Cascadia Mono Light" /f
reg add "HKCU\Console" /v WindowPosition /t REG_DWORD /d 0x00DC0096 /f
reg add "HKCU\Console" /v FontSize /t REG_DWORD /d 0x00140000 /f

echo Done.
timeout /t 3 /nobreak