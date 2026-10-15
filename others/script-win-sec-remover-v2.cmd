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
for /f "usebackq delims=" %%A in (`powershell -NoProfile -Command "$r=Invoke-RestMethod 'https://api.github.com/repos/ionuttbara/windows-defender-remover/releases/latest'; ($r.assets | Where-Object { $_.name -match '\.exe$' } | Select-Object -First 1).browser_download_url"`) do set "URL=%%A"
curl.exe -fL --retry 3 --limit-rate 5M -o "%USERPROFILE%\Downloads\defenderremover.exe" "%URL%"
"%USERPROFILE%\Downloads\DefenderRemover.exe" /r