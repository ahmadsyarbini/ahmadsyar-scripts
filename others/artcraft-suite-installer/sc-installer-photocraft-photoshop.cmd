@echo off
setlocal
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem readme this is for PhotoCraft installer because it doesn't have winget yet

set "REPO=storytold/photocraft"
set "OUT=%USERPROFILE%\Downloads\photocraft-%RANDOM%.msi"

echo Fetching latest PhotoCraft release...

powershell -NoProfile -Command ^
  "$api='https://api.github.com/repos/%REPO%/releases/latest';" ^
  "$asset=(Invoke-RestMethod $api).assets | Where-Object { $_.name -match '^photocraft-\d+\.\d+\.\d+-windows-x64\.msi$' } | Select-Object -First 1;" ^
  "if (-not $asset) { Write-Error 'Installer not found'; exit 1 };" ^
  "curl.exe -L --limit-rate 5M --output '%OUT%' $asset.browser_download_url"

if not exist "%OUT%" (
  echo Download failed.
  timeout /t 3 /nobreak >nul
  exit
)

echo Installing PhotoCraft silently...
msiexec /i "%OUT%" /qn /norestart

timeout /t 3 /nobreak >nul

del "%OUT%"
echo Done.