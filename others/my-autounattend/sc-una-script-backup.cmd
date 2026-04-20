@echo off
robocopy "C:\Windows\Setup\Scripts" "%userprofile%\My Drive\Documents\Tech\others\my-autounattend\una-script-backup" "*" /Mir /z /r:1 /w:1
echo copied
timeout /t 3 /nobreak >nul