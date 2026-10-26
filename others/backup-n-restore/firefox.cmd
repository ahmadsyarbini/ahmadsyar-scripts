@echo off
Title Firefox Backup and Restore

rem Define paths
set "SOURCE=%userprofile%\AppData\Roaming\Mozilla\Firefox\Profiles"
set "BACKUP_DIR=%~dp0firefox"
set "ZIP_TOOL=%ProgramFiles%\7-Zip\7z.exe"
set "ZIP_PATH=%BACKUP_DIR%\firefox_Backup.7z"

echo Press 1 to backup
echo Press 9 to restore
echo Press 3 to do nothing
choice /c:193 /D:3 /T:10
if %errorlevel% == 3 goto end
if %errorlevel% == 9 goto restore
if %errorlevel% == 1 goto backup

REM =============================Restore=============================
:restore
echo Restoring save files...
if not exist "%SOURCE%" mkdir "%SOURCE%"
if exist "%ZIP_PATH%" (
    "%ZIP_TOOL%" x "%ZIP_PATH%" -o"%SOURCE%" -y
    echo Restore complete!
) else (
    echo No backup archive found!
)
timeout /t 3 /nobreak >nul
goto end

REM =========================Backup===================================
:backup
echo Backing up save files...
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Delete the old zip
if exist "%SOURCE%" (
    echo Deleting existing archive...
    cd "%temp%"
    del "%ZIP_PATH%"
)

"%ZIP_TOOL%" a -t7z "%ZIP_PATH%" "%SOURCE%\*" -xr!*storage* -mx=9
echo Backup saved to: %ZIP_PATH%
timeout /t 3 /nobreak >nul
goto end

:end
exit
