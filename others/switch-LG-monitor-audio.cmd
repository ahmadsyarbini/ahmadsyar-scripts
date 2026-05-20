@echo off

rem README
rem For toggling LG Monitor Audio

Title "LG Audio switch"
echo Press [1] to turn on LG audio
echo Press [2] to turn off LG Audio
echo Press [3] to exit
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
rem disable that thing
soundvolumeview /Disable "NVIDIA High Definition Audio\Device\LG HDR WFHD\Render"
rem timeout to give it chance
timeout /t 1 /nobreak >nul
soundvolumeview /SetDefault "ATR USB microphone\Device\Speakers\Render" all
soundvolumeview /SetVolume "ATR USB microphone\Device\Speakers\Render" 50
goto end

:turnon
rem enable that thing
soundvolumeview /Enable "NVIDIA High Definition Audio\Device\LG HDR WFHD\Render"
rem timeout to give it chance
timeout /t 1 /nobreak >nul
soundvolumeview /SetDefault "NVIDIA High Definition Audio\Device\LG HDR WFHD\Render" all
soundvolumeview /SetVolume "NVIDIA High Definition Audio\Device\LG HDR WFHD\Render" 80
goto end
:end
exit