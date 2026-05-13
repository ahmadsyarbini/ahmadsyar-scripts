@echo off
setlocal
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

schtasks /Create /TN "AMR-script-update" /TR "\"%userprofile%\amr-scripts\Tech\1AA-script-repo-automata.cmd\"" /SC DAILY /ST 06:00 /RL HIGHEST

echo Scheduled task "AMR-script-update" created successfully.
timeout /t 3 > nul