@echo off
rem -------read-------
rem some service disabler. not sure if needed or not.
rem -------read-------
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem disable connected device and platform

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CDPSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v UserServiceFlags /t REG_DWORD /d 0 /f
echo done
timeout /t 3 /nobreak >nul