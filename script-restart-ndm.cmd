@echo off
taskkill /f /im NeatDM.exe >nul 2>&1
timeout /t 3 /nobreak >nul
start "" /min "C:\Program Files (x86)\Neat Download Manager\NeatDM.exe"