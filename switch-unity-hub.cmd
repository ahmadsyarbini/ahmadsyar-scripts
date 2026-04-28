@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title "Unity hub switch"
echo Press 1 to Enable Unity Hub
echo Press 2 to Disable Unity Hub
choice /c:123 /D:3 /T:5
if errorlevel == 3 goto end
if errorlevel == 2 goto turnoff
if errorlevel == 1 goto turnon

:turnoff
cd "%programfiles%\Unity hub"
ren "Unity Hub.exe" "Unity Hub.exe.bak"
echo Unity Hub renamed to backup
TIMEOUT /T 3 /nobreak >nul
goto end

:turnon
cd "%programfiles%\Unity hub"
ren "Unity Hub.exe.bak" "Unity Hub.exe"
echo Unity Hub renamed back to normal
TIMEOUT /T 3 /nobreak >nul
goto end
:end
exit