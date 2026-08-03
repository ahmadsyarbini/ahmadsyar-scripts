@echo off

rem This script just copying the file created by the autounattend.xml. The files disappears if windows reset or windows update fix process

robocopy "C:\Windows\Setup\Scripts" "%userprofile%\My Drive\Documents\Tech\others\my-autounattend\una-script-backup" "*" /mir /z /r:1 /w:1

rem to restore:

rem if not exist "C:\Windows\Setup\Scripts" mkdir "C:\Windows\Setup\Scripts"
rem robocopy "%userprofile%\My Drive\Documents\Tech\others\my-autounattend\una-script-backup" "C:\Windows\Setup\Scripts" "*" /mir /z /r:1 /w:1

echo copied

timeout /t 3 /nobreak >nul