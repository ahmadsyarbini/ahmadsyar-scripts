@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem README
rem this script is to toggle the nvidia container service

Title "Nvidia LS switch"
echo Press 1 to turn Nvidia LS ON
echo Press 2 to turn Nvidia LS OFF
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
taskkill /IM "NVIDIA App.exe" /T /F
taskkill /IM "nvcontainer.exe" /T /F
net stop "NVDisplay.ContainerLocalSystem"
net stop "NvContainerLocalSystem"
sc config "NVDisplay.ContainerLocalSystem" start= disabled
sc config "NvContainerLocalSystem" start= disabled
goto end

:turnon
sc config "NVDisplay.ContainerLocalSystem" start= demand
sc config "NvContainerLocalSystem" start= demand
net start "NVDisplay.ContainerLocalSystem"
net start "NvContainerLocalSystem"
rem start "" "C:\Program Files\WindowsApps\NVIDIACorp.NVIDIAControlPanel_8.1.969.0_x64__56jybvy8sckqj\nvcplui.exe"
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\NVIDIA App.lnk"
goto end

:end
exit