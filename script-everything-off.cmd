@echo off
del "%userprofile%\Desktop\*.lnk" /f /q
del "C:\Users\Public\Desktop\*.lnk" /f /q
net stop "AdobeARMservice"
net stop "CDPSvc"
net stop "ClickToRunSvc"
net stop "DiagTrack"
net stop "EABackgroundService"
net stop "logi_lamparray_service"
net stop "PhoneSvc"
net stop "SamsungMagicianSVC"
net stop "SamsungRapidSvc"
net stop "VMAuthdService"
net stop "VMnetDHCP"
net stop "VMUSBArbService"
net stop "VMware NAT Service"
net stop "VmwareAutostartService"
net stop "wlidsvc"
net stop "WSAIFabricSvc"
net stop "XblAuthManager"
net stop "XblGameSave"
net stop "XboxGipSvc"
net stop "XboxNetApiSvc"
netsh interface set interface "VMware Network Adapter VMnet1" admin=disable
netsh interface set interface "VMware Network Adapter VMnet8" admin=disable
sc config "AdobeARMservice" start= disabled
sc config "CDPSvc" start= disabled
sc config "ClickToRunSvc" start= demand
sc config "DiagTrack" start= disabled
sc config "EABackgroundService" start= demand
sc config "PhoneSvc" start= disabled
sc config "SamsungMagicianSVC" start= demand
sc config "SamsungRapidSvc" start= demand
sc config "VMAuthdService" start= demand
sc config "VMnetDHCP" start= demand
sc config "VMUSBArbService" start= demand
sc config "VMware NAT Service" start= demand
sc config "VmwareAutostartService" start= demand
sc config "wlidsvc" start= disabled
sc config "WSAIFabricSvc" start= demand
sc config "XblAuthManager" start= demand
sc config "XblGameSave" start= demand
sc config "XboxGipSvc" start= demand
sc config "XboxNetApiSvc" start= demand
sc delete "logi_lamparray_service"
schtasks.exe /Change /TN "klcp_update" /Disable
schtasks.exe /Change /TN "Launch Adobe CCXProcess" /Disable
schtasks.exe /Change /TN "SamsungMagician" /Disable
soundvolumeview /SetVolume "ATR USB microphone\Device\Microphone\Capture" 90
soundvolumeview /SetVolume "ATR USB microphone\Device\Speakers\Render" 50
taskkill /F /FI "IMAGENAME eq Adobe*" /T
taskkill /IM "acrotray.exe" /T /F
taskkill /IM "adb.exe" /T /F
taskkill /IM "appactions.exe" /T /F
taskkill /IM "CCLibrary.exe" /T /F
taskkill /IM "CCXProcess.exe" /T /F
taskkill /IM "crashpad_handler.exe" /T /F
taskkill /IM "CrossDeviceResume.exe" /T /F
taskkill /IM "smartscreen.exe" /T /F
taskkill /IM "TabTip.exe" /T /F
timeout /t 1 /nobreak >nul
rem pause