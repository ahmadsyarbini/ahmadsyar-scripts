@echo off

rem README
rem this script is for restarting NDM. Sometimes the icon tray disappears eventhough it's running

taskkill /f /im NeatDM.exe >nul 2>&1
timeout /t 3 /nobreak >nul
start "" /min "C:\Program Files (x86)\Neat Download Manager\NeatDM.exe"