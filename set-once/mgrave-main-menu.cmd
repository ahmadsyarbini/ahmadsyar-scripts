@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"