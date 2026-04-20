@echo off
setlocal EnableExtensions
title Restart Explorer and Clear Cache

echo [INFO] Stopping Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [INFO] Cleaning thumbnail and icon caches...

:: Thumbnail cache (Windows 10/11)
cd "%temp%"
del /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

:: Icon cache
del /q "%LOCALAPPDATA%\IconCache.db" >nul 2>&1
del /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1

echo [INFO] Flushing shell icon cache using task...
ie4uinit.exe -show >nul 2>&1

echo [INFO] Restarting Explorer...
start explorer.exe

echo [DONE] Explorer has been restarted and caches cleared.
timeout /t 3 /nobreak >nul
endlocal
exit /b
