@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title Windows Security Remover
cd /d %userprofile%
echo.
echo Turn off windows security real time protection temporarily
echo.
echo then press any key to continue
pause
curl -L -O "https://github.com/ionuttbara/windows-defender-remover/archive/refs/heads/main.zip"
tar -xf main.zip
del main.zip
cd windows-defender-remover-main
Script_Run.bat