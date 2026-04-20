@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
setlocal enableextensions

set "xmlDir=%temp%\xml"
set "xmlFile=%xmlDir%\winget-update.xml"

:: Create temp folder
md "%xmlDir%" 2>nul

:: Write a minimal, GUI-safe task definition (escape every < and >)
> "%xmlFile%" (
  echo ^<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>
  echo   ^<Triggers^>
  echo     ^<CalendarTrigger^>
  echo       ^<StartBoundary^>2025-01-01T06:00:00^</StartBoundary^>
  echo       ^<ScheduleByDay^>^<DaysInterval^>1^</DaysInterval^>^</ScheduleByDay^>
  echo     ^</CalendarTrigger^>
  echo   ^</Triggers^>
  echo   ^<Principals^>
  echo     ^<Principal id="Author"^>
  echo       ^<RunLevel^>HighestAvailable^</RunLevel^>
  echo     ^</Principal^>
  echo   ^</Principals^>
  echo   ^<Settings^>
  echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>
  echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>
  echo   ^</Settings^>
  echo   ^<Actions Context="Author"^>
  echo     ^<Exec^>
  echo       ^<Command^>powershell.exe^</Command^>
  echo       ^<Arguments^>-WindowStyle Minimized -Command "winget upgrade --all --silent --accept-package-agreements --accept-source-agreements"^</Arguments^>
  echo     ^</Exec^>
  echo   ^</Actions^>
  echo ^</Task^>
)

:: Import the task
schtasks /create /tn "winget-update" /xml "%xmlFile%" /f
set "rc=%errorlevel%"

:: Cleanup
cd /d %temp%
rd /s /q "%xmlDir%" 2>nul

::residue of previous coding
rem schtasks /create /tn "winget-update" /tr "cmd.exe /c winget upgrade --all --silent" /sc daily /st 06:00 /rl highest /f

echo Scheduled task "winget-update" created successfully.
timeout /t 3 >nul