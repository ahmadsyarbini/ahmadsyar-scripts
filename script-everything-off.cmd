@echo off
taskkill /F /FI "IMAGENAME eq Adobe*" /T
taskkill /IM "acrotray.exe" /T /F
taskkill /IM "adb.exe" /T /F
taskkill /IM "CCLibrary.exe" /T /F
taskkill /IM "CCXProcess.exe" /T /F
taskkill /IM "whatsapp.exe" /T /F
taskkill /IM "CrossDeviceResume.exe" /T /F
taskkill /IM "appactions.exe" /T /F
schtasks.exe /Change /TN "klcp_update" /Disable
schtasks.exe /Change /TN "Launch Adobe CCXProcess" /Disable
schtasks.exe /Change /TN "SamsungMagician" /Disable
net stop "AdobeARMservice"
net stop "ClickToRunSvc"
net stop "DiagTrack"
net stop "EABackgroundService"
net stop "PhoneSvc"
net stop "SamsungMagicianSVC"
net stop "SamsungRapidSvc"
net stop "VMAuthdService"
net stop "VMnetDHCP"
net stop "VMUSBArbService"
net stop "VMware NAT Service"
net stop "VmwareAutostartService"
net stop "XblAuthManager"
net stop "XblGameSave"
net stop "XboxGipSvc"
net stop "XboxNetApiSvc"
sc config "ClickToRunSvc" start=demand
sc config "DiagTrack" start=demand
sc config "EABackgroundService" start=demand
sc config "PhoneSvc" start=disabled
sc config "SamsungMagicianSVC" start=demand
sc config "SamsungRapidSvc" start=demand
sc config "VMAuthdService" start=demand
sc config "VMnetDHCP" start=demand
sc config "VMUSBArbService" start=demand
sc config "VMware NAT Service" start=demand
sc config "VmwareAutostartService" start=demand
sc config "XblAuthManager" start=demand
sc config "XblGameSave" start=demand
sc config "XboxGipSvc" start=demand
sc config "XboxNetApiSvc" start=demand
sc config AdobeARMservice start= demand
sc delete "logi_lamparray_service"
sc stop "logi_lamparray_service"
netsh interface set interface "VMware Network Adapter VMnet1" admin=disable
netsh interface set interface "VMware Network Adapter VMnet8" admin=disable
del "%userprofile%\Desktop\*.lnk" /f /q
del "C:\Users\Public\Desktop\*.lnk" /f /q
soundvolumeview /SetVolume "ATR USB microphone\Device\Microphone\Capture" 90
rem ping remote node to check if they are online
rem ping -n 1 Benisaki
rem ping -n 1 Haruno-Printer
timeout /t 4 /nobreak >nul