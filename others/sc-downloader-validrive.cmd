@echo off

rem readme : this is for downloading validrive

curl -L "https://www.grc.com/files/validrive.exe" -o "%~dp0validrive.exe"
echo download finished
timeout /t 5 >nul