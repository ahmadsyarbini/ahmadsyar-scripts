@echo off
setlocal

set "INSTALL_DIR=%USERPROFILE%\pwrp"
set "ZIP=%TEMP%\pwrp.zip"
rem set "URLFILE=%TEMP%\pwrp_url.txt"

echo Finding latest Portwarp Windows AMD64 build...

rem simpan jap auto version finder. tengah rosak.
rem powershell -NoProfile -Command "$h=(Invoke-WebRequest -UseBasicParsing 'https://portwarp.com/downloads').Content; $m=[regex]::Match($h,'https://portwarp\.com/download/pwrp-[^""''\s]+-windows-amd64\.zip'); if($m.Success){$m.Value | Set-Content '%URLFILE%'}else{exit 1}"


rem if errorlevel 1 (
rem     echo Failed to find download URL.
rem     exit /b 1
rem )

rem set /p "URL="<"%URLFILE%"

rem echo Downloading %URL%
rem curl -fL "%URL%" -o "%ZIP%"
curl "https://portwarp.com/download/pwrp-0.3.3-windows-amd64.zip" -o "%ZIP%"

if errorlevel 1 (
    echo Download failed.
    exit /b 1
)

if exist "%INSTALL_DIR%" rmdir /s /q "%INSTALL_DIR%"
mkdir "%INSTALL_DIR%"

echo Extracting...
tar -xf "%ZIP%" -C "%INSTALL_DIR%"

if errorlevel 1 (
    echo Extraction failed.
    exit /b 1
)

rem cleanup
del "%ZIP%"
rem del "%URLFILE%"

echo.
echo Portwarp installed to:
echo %INSTALL_DIR%
echo.

"%INSTALL_DIR%\pwrp.exe" --version

echo.

echo if the version number is visible, it is installed correctly

endlocal
timeout /t 5 /nobreak >nul