@echo off
title Script Folder Mirroring

rem source
set "SourceWinScript=%userprofile%\My Drive\Documents\Tech"
rem targets
rem set "targetpdrive=F:\Tech"
set "localfolder=%userprofile%\amr-scripts\Tech"

rem ------------------- pendrive drive letter checker ---------------------

for /f "delims=" %%D in ('powershell -NoProfile -Command "Get-Volume | Where-Object { $_.DriveLetter -and (Test-Path ($_.DriveLetter + ':\amr-drive.txt')) } | Select-Object -First 1 -ExpandProperty DriveLetter"') do set "DRIVE=%%D:"

if not defined DRIVE (
    echo Target pendrive not found. proceed with git sync
    echo.
    timeout /t 1 /nobreak >nul
)

echo Target pendrive: %DRIVE%
echo.

rem ------------------- mirror to pendrive targets -------------------

rem local source condition, mirror from source to pendrive

rem simpan jap
rem if exist "%SourceWinScript%" (
rem     if exist "%DRIVE%" (
rem         robocopy "%SourceWinScript%" "%DRIVE%\Tech" "*" /MIR /DCOPY:D /COPY:D /W:1 /R:1 /NDL /NJH /NJS /NS /XD ".git"
rem ) else (
rem     echo missing: "%SourceWinScript%" or "%DRIVE%\Tech"
rem )
rem )

if exist "%SourceWinScript%" if exist "%DRIVE%" (
    robocopy "%SourceWinScript%" "%DRIVE%\Tech" "*" /MIR /DCOPY:D /COPY:D /W:1 /R:1 /NDL /NJH /NJS /NS /XD ".git"
) else (
    echo missing: "%SourceWinScript%" or "%DRIVE%"
)

rem condition remote pc with internet exist, mirror github repo to local
if exist "%localfolder%" (
    call "2AA-has-internet-deployment.cmd" 
)

rem push to github, if on local source
if exist "%SourceWinScript%" (
    cd /d "%SourceWinScript%"
    git add -A
    git commit -m "update"
    git push origin main --force
) else (
    echo source ahmadsyar repo not found. skipping git push.
)

pause
rem timeout /t 1 /nobreak >nul