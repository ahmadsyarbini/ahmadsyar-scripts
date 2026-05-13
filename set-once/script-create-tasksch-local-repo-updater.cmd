@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator
setlocal enableextensions

set "xmlDir=%temp%\xml"
set "xmlFile=%xmlDir%\amr-scripts-update.xml"

md "%xmlDir%" 2>nul

> "%xmlFile%" (
  echo ^<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>
  echo   ^<Triggers^>
  echo     ^<CalendarTrigger^>
  echo       ^<StartBoundary^>2026-05-15T06:00:00^</StartBoundary^>
  echo       ^<ScheduleByDay^>^<DaysInterval^>1^</DaysInterval^>^</ScheduleByDay^>
  echo     ^</CalendarTrigger^>
  echo   ^</Triggers^>
  echo   ^<Principals^>
  echo     ^<Principal id="Author"^>
  echo       ^<LogonType^>InteractiveToken^</LogonType^>
  echo     ^</Principal^>
  echo   ^</Principals^>
  echo   ^<Settings^>
  echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>
  echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>
  echo   ^</Settings^>
  echo   ^<Actions Context="Author"^>
  echo     ^<Exec^>
  echo       ^<Command^>%%userprofile%%\amr-scripts\Tech\2AA-has-internet-deployment.cmd^</Command^>
  echo     ^</Exec^>
  echo   ^</Actions^>
  echo ^</Task^>
)

rem Import the task
schtasks /create /tn "amr-script-update" /xml "%xmlFile%" /f
set "rc=%errorlevel%"

rem Cleanup
cd /d %temp%
rd /s /q "%xmlDir%" 2>nul

echo Scheduled task "AMR-script-update" created successfully.
timeout /t 3 > nul