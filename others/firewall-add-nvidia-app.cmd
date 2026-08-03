@echo off
rem Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
rem End of admin elevator

rem this is for adding firewall to nvidia app

rem delete first
netsh advfirewall firewall delete rule name="block-nvidia-app-in" dir=out
netsh advfirewall firewall delete rule name="block-nvidia-app-out" dir=in
netsh advfirewall firewall delete rule name="block-nvidia-container-in" dir=out
netsh advfirewall firewall delete rule name="block-nvidia-container-out" dir=in
rem then add
netsh advfirewall firewall add rule name="block-nvidia-app-in" dir=in action=block program="C:\Program Files\NVIDIA Corporation\NVIDIA App\CEF\NVIDIA App.exe" enable=yes
netsh advfirewall firewall add rule name="block-nvidia-app-out" dir=out action=block program="C:\Program Files\NVIDIA Corporation\NVIDIA App\CEF\NVIDIA App.exe" enable=yes
netsh advfirewall firewall add rule name="block-nvidia-container-in" dir=in action=block program="C:\Program Files\NVIDIA Corporation\NvContainer\nvcontainer.exe" enable=yes
netsh advfirewall firewall add rule name="block-nvidia-container-out" dir=out action=block program="C:\Program Files\NVIDIA Corporation\NvContainer\nvcontainer.exe" enable=yes
echo nvidia app firewall added
endlocal
timeout /t 3 /nobreak >nul
