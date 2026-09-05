@echo off

rem readme : this is for downloading validrive
set "dir=%userprofile%\local-software"
if not exist "%dir%" mkdir "%dir%"
cd /d "%dir%"
curl -L "https://www.grc.com/files/validrive.exe" -o "%dir%\validrive.exe"
echo download finished
timeout /t 5 >nul