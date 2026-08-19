@echo off

rem README
rem this script is to force close google drive and restarting it

echo Restarting Google Drive...

rem Kill existing Google Drive processes
taskkill /f /im "googledrivesync.exe"
taskkill /f /im "GoogleDriveFS.exe"
taskkill /f /im "crashpad_handler.exe"

rem Wait to ensure proper shutdown
timeout /t 5 /nobreak >nul

rem restarting using shortcut
start "" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Google Drive.lnk"

echo Google Drive restarted.
timeout /t 3 >nul
