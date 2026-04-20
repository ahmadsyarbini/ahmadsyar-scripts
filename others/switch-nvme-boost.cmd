@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title NVME Driver switch
echo NVME driver switch beta
echo Press [1] to enable experimental nvme driver
echo Press [2] to disable experimental nvme driver
echo Press [3] to do nothing

choice /c 123 /D:3 /T:360 /m "Enter your choice: "
if %errorlevel% == 1 goto enable
if %errorlevel% == 2 goto disable
if %errorlevel% == 3 goto end

:enable
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 156965516 /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 1853569164 /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 735209102 /t REG_DWORD /d 1 /f
echo nvme experiment begins
timeout /t 5 /nobreak >nul
goto end

:disable
reg delete HKLM\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 156965516 /f
reg delete HKLM\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 1853569164 /f
reg delete HKLM\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 735209102 /f
echo reverting back to normal
timeout /t 5 /nobreak >nul
goto end

:end
exit