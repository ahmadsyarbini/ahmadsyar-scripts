@echo off
Title VMWare svc switches
echo Press [1] to turn on vmware services
echo Press [2] to turn off vmware services
choice /c:123 /D:3 /T:5
if %errorlevel% == 3 goto end
if %errorlevel% == 2 goto turnoff
if %errorlevel% == 1 goto turnon

:turnoff
net stop "VMAuthdService"
net stop "VMnetDHCP"
net stop "VMUSBArbService"
net stop "VMware NAT Service"
net stop "VmwareAutostartService"
sc config "VMAuthdService" start=demand
sc config "VMnetDHCP" start=demand
sc config "VMware NAT Service" start=demand
sc config "VMUSBArbService" start=demand
netsh interface set interface "VMware Network Adapter VMnet1" admin=disable
netsh interface set interface "VMware Network Adapter VMnet8" admin=disable
goto end

:turnon
netsh interface set interface "VMware Network Adapter VMnet1" admin=enabled
netsh interface set interface "VMware Network Adapter VMnet8" admin=enabled
net start "VMAuthdService"
net start "VMnetDHCP"
net start "VMUSBArbService"
net start "VMware NAT Service"
net start "VmwareAutostartService"
goto end

:end
exit