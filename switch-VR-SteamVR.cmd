@echo off
Title "Steam VR Mode switch"
echo Press [1] to turn on steam VR Mode
echo Press [2] to turn off steam VR Mode
echo Press [3] to exit
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
soundvolumeview /Disable "Steam Streaming Microphone\Device\Microphone\Capture"
soundvolumeview /Disable "Steam Streaming Microphone\Device\Speakers\Render"
soundvolumeview /Disable "Steam Streaming Speakers\Device\Speakers\Render"
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
ipconfig -flushdns
start "" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\MSI Afterburner\MSI Afterburner.lnk" -s
start "" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\f.lux.lnk" -noshow
goto end

:turnon
soundvolumeview /Enable "Steam Streaming Microphone\Device\Microphone\Capture"
soundvolumeview /Enable "Steam Streaming Microphone\Device\Speakers\Render"
soundvolumeview /Enable "Steam Streaming Speakers\Device\Speakers\Render"
taskkill /F /FI "IMAGENAME eq Adobe*" /T
taskkill /IM "CCXProcess.exe" /T /F
taskkill /IM "crashpad_handler.exe" /T /F
taskkill /IM "flux.exe" /T /F
taskkill /IM "MSIAfterburner.exe" /T /F
taskkill /IM "OfficeClickToRun.exe" /T /F
taskkill /IM "SDXHelper.exe" /T /F
taskkill /IM "whatsapp.exe" /T /F 
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
cd "%userprofile%\Downloads"
rem rmdir /S /Q "%AppData%\..\LocalLow\VRChat\VRChat\LocalPlayerModerations"
rmdir /S /Q "%UserProfile%\AppData\LocalLow\VRChat\VRChat\LocalPlayerModerations"
ipconfig -flushdns
goto end
:end
exit