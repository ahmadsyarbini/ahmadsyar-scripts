@echo off
:: ==== Close Discord ====
echo Closing Discord if running...
taskkill /IM Discord.exe /F >nul 2>&1
taskkill /IM Update.exe /F >nul 2>&1
timeout /t 2 /nobreak >nul

:: ==== Set Variables ====
set "OPENASAR_URL=https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar"
set "DISCORD_DIR=%localappdata%\Discord"
set "TEMP_DIR=%temp%\discordopenasar"

:: ==== Find the latest Discord app folder ====
set "LATEST_APP="
for /f "delims=" %%i in ('dir "%DISCORD_DIR%\app-*" /b /ad') do (
    set "LATEST_APP=%%i"
)
if "%LATEST_APP%"=="" (
    echo Discord folder not found!
    pause
    exit /b
)
:: Point to the resources folder
set "APP_PATH=%DISCORD_DIR%\%LATEST_APP%\resources"

:: ==== Create backup using robocopy ====
if exist "%APP_PATH%\app.asar" (
    robocopy "%APP_PATH%" "%APP_PATH%" "app.asar" /R:1 /W:1 /B /IS /IT /COPYALL
    ren "%APP_PATH%\app.asar" "app.asar.bak"
    echo Backup created: app.asar.bak
) else (
    echo app.asar not found!
    pause
    exit /b
)

:: ==== Download new app.asar ====
mkdir "%TEMP_DIR%"
curl -L "%OPENASAR_URL%" -o "%TEMP_DIR%\app.asar"
if errorlevel 1 (
    echo Download failed!
    rmdir /s /q "%TEMP_DIR%"
    pause
    exit /b
)

:: ==== Replace app.asar using robocopy ====
robocopy "%TEMP_DIR%" "%APP_PATH%" "app.asar" /R:2 /W:1 /IS /IT /COPYALL
if errorlevel 1 (
    echo Failed to replace app.asar!
    rmdir /s /q "%TEMP_DIR%"
    pause
    exit /b
)

:: ==== Cleanup ====
rmdir /s /q "%TEMP_DIR%"

:: ==== User acknowledgment ====
echo app.asar replaced successfully.
echo Starting Discord...
start "" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
timeout /t 3 >nul