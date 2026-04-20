@echo off
echo Restarting Google Drive...

:: Kill existing Google Drive processes
taskkill /f /im "googledrivesync.exe"
taskkill /f /im "GoogleDriveFS.exe"
taskkill /f /im "crashpad_handler.exe"

:: Wait to ensure proper shutdown
timeout /t 5 /nobreak >nul

:: Try launching via system-wide Start Menu shortcut
start "" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Google Drive.lnk"

echo Google Drive restarted.
timeout /t 3 >nul
