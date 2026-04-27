@echo off
curl -L -o"%temp%\clover-setup.exe" "https://github.com/ahmadsyarbini/clover-backup/raw/refs/heads/main/setup_clover_3.5.4.exe"
cd %temp%
clover-setup.exe /S
cd %temp%
if exist "%temp%\clover-setup.exe" del /q "%temp%\clover-setup.exe"
timeout /t 5 /nobreak >nul
taskkill /IM "clover-setup.exe" /T /F