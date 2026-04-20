@echo off
setlocal
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator

:: Temp workspace
set "WORKDIR=%TEMP%\OfficeSetup"
set "CONFIG_FILE=%WORKDIR%\configuration.xml"
set "SETUP_EXE=%WORKDIR%\setup.exe"

:: Create working directory
md "%WORKDIR%" 2>nul

:: Generate configuration.xml
> "%CONFIG_FILE%" (
  echo ^<Configuration^>
  echo   ^<Add OfficeClientEdition="64" Channel="Current"^>
  echo     ^<Product ID="O365ProPlusEEANoTeamsRetail"^>
  echo       ^<Language ID="en-us" /^>
  echo       ^<Language ID="en-gb" /^>
  echo       ^<Language ID="ms-my" /^>
  echo       ^<ExcludeApp ID="Access" /^>
  echo       ^<ExcludeApp ID="Groove" /^>
  echo       ^<ExcludeApp ID="Lync" /^>
  echo       ^<ExcludeApp ID="OneDrive" /^>
  echo       ^<ExcludeApp ID="OneNote" /^>
  echo       ^<ExcludeApp ID="Outlook" /^>
  echo       ^<ExcludeApp ID="OutlookForWindows" /^>
  echo       ^<ExcludeApp ID="Publisher" /^>
  echo     ^</Product^>
  echo   ^</Add^>
  echo   ^<Property Name="SharedComputerLicensing" Value="0" /^>
  echo   ^<Property Name="SCLCacheOverride" Value="0" /^>
  echo   ^<Property Name="DeviceBasedLicensing" Value="0" /^>
  echo   ^<Property Name="OfficeMgmtCOM" Value="TRUE" /^>
  echo ^</Configuration^>
)

:: Download setup.exe directly from Microsoft CDN
powershell -Command ^
"Invoke-WebRequest -Uri 'https://officecdn.microsoft.com/pr/wsus/setup.exe' -OutFile '%WORKDIR%\setup.exe'"

:: Run installer with visual progress
if exist "%SETUP_EXE%" (
  echo Launching Office 365 installer
  "%SETUP_EXE%" /configure "%CONFIG_FILE%"
) else (
  echo Error: setup.exe not found. Download may have failed.
)

:: Cleanup
cd /d %temp%
rd /s /q "%WORKDIR%"

::pin that office to prevent winget trigger
winget pin add Microsoft.Office --accept-source-agreements

::activation
echo activating office using ohook method
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& ([ScriptBlock]::Create((irm https://get.activated.win))) /Ohook"

echo Done.
timeout /t 5 /nobreak >nul
endlocal