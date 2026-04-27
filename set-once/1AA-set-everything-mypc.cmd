@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator
rem go to current directory
cd /d "%~dp0"
rem Run PowerShell script
powershell -ExecutionPolicy Bypass -File "ps1-script-custom-region.ps1"

rem Apply sound scheme
reg import "reg-sound-scheme-my-win11.reg"

rem Run batch scripts
rem ahk part
call "script-create-ahk-shortcut.cmd"
call "script-sharpkey-remap.cmd"
rem openrgb part
call "script-create-tasksch-openrgb-lightsoff.cmd"
rem winget autoupdate part
call "script-create-tasksch-winget-autoupdate.cmd"
call "script-conhost-theme.cmd"