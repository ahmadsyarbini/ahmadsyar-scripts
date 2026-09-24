@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
rem for mapping left alt to left ctrl
rem for mapping scroll lock to f13
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d 0000000000000000030000001D0038006D00460000000000 /f
echo Left Alt remapped to Left Ctrl. Reboot required.
timeout /t 3 /nobreak >nul