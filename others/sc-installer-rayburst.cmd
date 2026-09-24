@echo off
setlocal
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem installer for non-winget but available on github or other sources

set "REPO=AnInsomniacy/rayburst"
set "OUT=%USERPROFILE%\Downloads\rayburst-%RANDOM%.exe"

echo Fetching latest rayburst release...

powershell -NoProfile -Command ^
  "$api='https://api.github.com/repos/%REPO%/releases/latest';" ^
  "$asset=(Invoke-RestMethod $api).assets | Where-Object { $_.name -match '^Rayburst_\d+\.\d+\.\d+_x64-setup\.exe$' } | Select-Object -First 1;" ^
  "if (-not $asset) { Write-Error 'Installer not found'; exit 1 };" ^
  "curl.exe -L --output '%OUT%' $asset.browser_download_url"

if not exist "%OUT%" (
  echo Download failed.
  timeout /t 3 /nobreak >nul
  exit
)

echo Installing rayburst silently...
"%OUT%" /S

timeout /t 3 /nobreak >nul

del "%OUT%"
echo Done.