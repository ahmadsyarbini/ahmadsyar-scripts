@echo off
echo Force closing Discord...
taskkill /F /IM discord.exe >nul 2>&1
timeout /t 2 >nul

echo Navigating to Discord AppData folder...
echo Checking if Discord folder exists...
if exist "%APPDATA%\discord" (
    echo Folder found. Proceeding...
    cd /d "%APPDATA%\discord"
    echo Clearing cache folders...
    rd /s /q "Cache"
    rd /s /q "Code Cache"
    rd /s /q "component_crx_cache"
    rd /s /q "DawnGraphiteCache"
    rd /s /q "DawnWebGPUCache"
    rd /s /q "GPUCache"
    echo Restarting Discord...
    start "" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
	echo Done. Cache wiped and Discord restarted.
	timeout /t 3 >nul
	exit /b
) else (
    echo Discord folder not found. Skipping cleanup.
	start "" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
	exit /b
)
timeout /t 3 >nul