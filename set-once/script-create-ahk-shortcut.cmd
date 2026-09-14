@echo off

set "SOURCE=%USERPROFILE%\My Drive\Documents\Tech\set-once\ahk-mykey.exe"
set "TARGET=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ahk-mykey.lnk"

powershell -NoProfile -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%TARGET%');$s.TargetPath='%SOURCE%';$s.Save()"
echo shortcut created at shell startup
timeout /t 5 /nobreak >nul