@echo off
title Script Folder Mirroring

rem source
set "SourceWinScript=%userprofile%\My Drive\Documents\Tech"
rem targets
set "targetpdrive=F:\Tech"
set "localfolder=%userprofile%\asr-scripts\Tech"
rem set "pdrive_no_internet=%~dp0."

rem mirror to targets
rem local source condition, mirror from source to pendrive
if exist "%SourceWinScript%" (
    if exist "%targetpdrive%" (
        robocopy "%SourceWinScript%" "%targetpdrive%" "*" /MIR /DCOPY:D /COPY:D /W:1 /R:1 /NDL /NJH /NJS /XD ".git"
) else (
    echo missing: "%SourceWinScript%" or "%targetpdrive%"
)
)
rem remote pc condition with internet exist, mirror github repo to local
if exist "%localfolder%" (
    call "2AA-has-internet-deployment" 
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

rem pause
timeout /t 2 /nobreak >nul