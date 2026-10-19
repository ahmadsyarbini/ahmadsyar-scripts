@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
winget --version >nul 2>&1 && exit /b 0
cd /d "%TEMP%" || exit /b 1
curl.exe -fL --retry 3 --limit-rate 5M -o deps.zip "https://github.com/microsoft/winget-cli/releases/latest/download/DesktopAppInstaller_Dependencies.zip" || exit /b 1
curl.exe -fL --retry 3 --limit-rate 5M -o winget.msixbundle "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" || exit /b 1
powershell.exe -NoProfile -Command "$d='%TEMP%\winget-deps'; Expand-Archive '%TEMP%\deps.zip' $d -Force; $p=@(Get-ChildItem $d -Recurse -File | Where-Object { $_.Name -match 'x64' -and $_.Extension -in '.appx','.msix' } | Select-Object -ExpandProperty FullName); Add-AppxPackage -Path '%TEMP%\winget.msixbundle' -DependencyPath $p -ErrorAction Stop"
if errorlevel 1 exit /b 1
winget --version
if errorlevel 1 exit /b 1
del "%TEMP%\deps.zip" "%TEMP%\winget.msixbundle"
rmdir /s /q "%TEMP%\winget-deps"
timeout /t 3 /nobreak >nul