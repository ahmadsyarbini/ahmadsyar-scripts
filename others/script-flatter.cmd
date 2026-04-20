@echo off
setlocal

echo Script to flatten files into one big folder
echo.
echo Drag and drop the SOURCE folder, then press Enter:
set /p "source=> "
echo.

echo Drag and drop the DESTINATION folder, then press Enter:
set /p "destination=> "
echo.

rem Remove surrounding quotes if present
set "source=%source:"=%"
set "destination=%destination:"=%"

echo Flattening files from:
echo Source: %source%
echo Destination: %destination%
echo.

for /R "%source%" %%F in (*) do (
    set "rel=%%~dpF"
    setlocal enabledelayedexpansion
    set "relpath=!rel:%source%=!"
    set "safe=!relpath:\=_!"
    copy "%%F" "%destination%\!safe!%%~nxF" >nul
    endlocal
)

echo Done.
pause
