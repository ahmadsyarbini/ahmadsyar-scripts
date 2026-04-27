@echo off
setlocal
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

set "REPO=rustdesk/rustdesk"
set "OUT=%USERPROFILE%\Downloads\rustdesk-%RANDOM%.exe"

echo Fetching latest RustDesk release...

powershell -NoProfile -Command ^
  "$api='https://api.github.com/repos/%REPO%/releases/latest';" ^
  "$asset=(Invoke-RestMethod $api).assets | Where-Object { $_.name -match '^rustdesk-\d+\.\d+\.\d+-x86_64\.exe$' } | Select-Object -First 1;" ^
  "if (-not $asset) { Write-Error 'Installer not found'; exit 1 };" ^
  "Invoke-WebRequest $asset.browser_download_url -OutFile '%OUT%'"

if not exist "%OUT%" (
  echo Download failed.
  exit /b 1
)

echo Installing RustDesk silently...
"%OUT%" --silent-install

del "%OUT%"
echo Done.
