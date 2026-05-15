@echo off

rem README
rem For toggling VR mode

Title "VR Mode switch"
echo Press [1] to turn on steam VR Mode
echo Press [2] to turn off steam VR Mode
echo Press [3] to exit
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
rem alvr stuff
soundvolumeview /Disable "Virtual Audio Cable\Device\Line 1\Capture"
soundvolumeview /Disable "Virtual Audio Cable\Device\Line 1\Render"
rem kill vd and pico
taskkill /IM "ALVR Dashboard.exe" /T /F
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
ipconfig -flushdns
start "" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\f.lux.lnk" -noshow
start "" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\MSI Afterburner\MSI Afterburner.lnk" -s
rem start steam again with non-admin, normal user start
powershell -Command "$s=New-Object -ComObject Shell.Application; $s.ShellExecute('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Steam\Steam.lnk','','','open',1)"
goto end

:turnon
rem alvr stuff
soundvolumeview /Enable "Virtual Audio Cable\Device\Line 1\Capture"
soundvolumeview /Enable "Virtual Audio Cable\Device\Line 1\Render"
rem timeout to give it chance
timeout /t 1 /nobreak >nul
soundvolumeview /SetVolume "ATR USB microphone\Device\Speakers\Render" 50
soundvolumeview /SetVolume "Virtual Audio Cable\Device\Line 1\Capture" 40
soundvolumeview /SetVolume "Virtual Audio Cable\Device\Line 1\Render" 70
taskkill /F /FI "IMAGENAME eq Adobe*" /T
taskkill /IM "CCXProcess.exe" /T /F
taskkill /IM "crashpad_handler.exe" /T /F
taskkill /IM "flux.exe" /T /F
taskkill /IM "MSIAfterburner.exe" /T /F
taskkill /IM "OfficeClickToRun.exe" /T /F
taskkill /IM "SDXHelper.exe" /T /F
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
rmdir /S /Q "%UserProfile%\AppData\LocalLow\VRChat\VRChat\LocalPlayerModerations"
ipconfig -flushdns
goto end
:end
exit