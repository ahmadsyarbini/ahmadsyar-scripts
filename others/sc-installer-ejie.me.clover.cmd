@echo off
curl -L -o"%temp%\clover-setup.exe" "http://cn.ejie.me/uploads/setup_clover@3.5.4.exe"
cd %temp%
clover-setup.exe /S
cd %temp%
timeout /t 5 /nobreak >nul
taskkill /IM "clover-setup.exe" /T /F