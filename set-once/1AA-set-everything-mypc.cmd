@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
:: go to current directory
cd /d "%~dp0"
:: Run PowerShell script
powershell -ExecutionPolicy Bypass -File "ps1-script-custom-region.ps1"

:: Apply sound scheme
reg import "reg-sound-scheme-my-win11.reg"

:: Run batch scripts
:: ahk part
call "script-create-ahk-shortcut.cmd"
call "script-sharpkey-remap.cmd"
::openrgb part
call "script-create-tasksch-openrgb-lightsoff.cmd"
::winget autoupdate part
call "script-create-tasksch-winget-autoupdate.cmd"
call "script-conhost-theme.cmd"