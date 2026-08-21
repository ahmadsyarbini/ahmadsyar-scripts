@echo off
setlocal

rem set value dulu
set "BASE=https://portwarp.com/download"
set "TXT=%TEMP%\pwrp-checksums.txt"
set "INSTALL_DIR=%USERPROFILE%\pwrp"

rem download text file
curl -L -o "%TXT%" "%BASE%/checksums.txt"

rem cari filename
for /f "tokens=2" %%A in ('findstr "windows-amd64.zip" "%TXT%"') do set "ZIP=%%A"

echo Found: %ZIP%

rem download zip
curl -L -o "%TEMP%\%ZIP%" "%BASE%/%ZIP%"

rem unzip
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
tar -xf "%TEMP%\%ZIP%" -C "%INSTALL_DIR%"

del "%TXT%"
del "%TEMP%\%ZIP%"

"%INSTALL_DIR%\pwrp.exe" --version

timeout /t 3 /nobreak >nul