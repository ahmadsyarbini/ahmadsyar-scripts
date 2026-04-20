@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title "Nvidia LS switch"
echo Press 1 to turn Nvidia LS ON
echo Press 2 to turn Nvidia LS OFF
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
net stop "NVDisplay.ContainerLocalSystem"
sc config "NVDisplay.ContainerLocalSystem" start= demand
goto end

:turnon
net start "NVDisplay.ContainerLocalSystem"
cmd /c "C:\Program Files\WindowsApps\NVIDIACorp.NVIDIAControlPanel_8.1.969.0_x64__56jybvy8sckqj\nvcplui.exe"
goto end

:end
exit