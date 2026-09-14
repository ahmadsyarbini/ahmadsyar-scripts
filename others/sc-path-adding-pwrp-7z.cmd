@echo off
set "PWRP_DIR=%USERPROFILE%\pwrp"
set "SEVENZIP_DIR=C:\Program Files\7-Zip"

for /f "tokens=2,*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%B"

echo ;%USER_PATH%; | findstr /i /c:";%PWRP_DIR%;" >nul || set "USER_PATH=%USER_PATH%;%PWRP_DIR%"
echo ;%USER_PATH%; | findstr /i /c:";%SEVENZIP_DIR%;" >nul || set "USER_PATH=%USER_PATH%;%SEVENZIP_DIR%"

reg add "HKCU\Environment" /v Path /t REG_EXPAND_SZ /d "%USER_PATH%" /f >nul

echo path added
timeout /t 3 /nobreak >nul