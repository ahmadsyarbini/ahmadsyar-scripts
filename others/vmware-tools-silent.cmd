@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem README Vmware tool quick silent installer for windows 11 and 10.
rem usage : Disconnect OS iso first, then mount the vmware tools iso using the "install vmware tools" menu
rem ignore this trying new method

for /f "delims=" %%D in ('powershell -NoProfile -Command "Get-Volume | Where-Object { $_.DriveLetter -and (Test-Path ($_.DriveLetter + ':\setup.exe')) } | Select-Object -First 1 -ExpandProperty DriveLetter"') do set "VMTOOLS=%%D:\setup.exe"

echo Found: "%VMTOOLS%"

"%VMTOOLS%" /S /v"/qn ADDLOCAL=ALL REBOOT=Force"
timeout /t 5 /nobreak >nul