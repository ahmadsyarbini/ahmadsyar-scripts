@echo off
setlocal
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem FileBrowser Quantum
set "REPO=gtsteffaniak/filebrowser"
set "OUT=%USERPROFILE%\fbq\filebrowser.exe"

if not exist "%USERPROFILE%\fbq" mkdir "%USERPROFILE%\fbq"

echo Fetching latest FileBrowser Quantum release...

powershell -NoProfile -Command ^
  "$api='https://api.github.com/repos/%REPO%/releases?per_page=100';" ^
  "$r=Invoke-RestMethod $api;" ^
  "$rel=$r | Where-Object { -not $_.prerelease -and $_.tag_name -match '-stable$' } | Select-Object -First 1;" ^
  "$asset=$rel.assets | Where-Object { $_.name -eq 'filebrowser.exe' } | Select-Object -First 1;" ^
  "if (-not $asset) { Write-Error 'Stable executable not found'; exit 1 };" ^
  "curl.exe -fL --retry 3 --limit-rate 5M --output '%OUT%' $asset.browser_download_url"

if errorlevel 1 (
  echo Download failed.
  timeout /t 3 /nobreak >nul
  exit /b 1
)

if not exist "%OUT%" (
  echo Download failed.
  timeout /t 3 /nobreak >nul
  exit /b 1
)

echo Done.
timeout /t 3 /nobreak >nul