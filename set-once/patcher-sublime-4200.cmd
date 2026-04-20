@echo off
REM Force console size: 120 x 30
mode con cols=120 lines=30
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0patcher-sublime-4200.ps1"
timeout /t 2 > nul