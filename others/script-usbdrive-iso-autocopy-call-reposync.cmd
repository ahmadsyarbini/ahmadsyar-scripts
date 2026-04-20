@echo off
set "source_microsoft=D:\Lib Microsoft"
set "source_linux=D:\Lib Linux"
set "destination_m=%~dp0ISO-Microsoft"
set "destination_l=%~dp0ISO-Linux"
set "automata_path=%userprofile%\My Drive\Documents\Tech"
set "automata_file=1AA-script-repo-automata.cmd"
set "this_script=%userprofile%\My Drive\Documents\Tech\others\script-usbdrive-iso-autocopy-call-reposync.cmd"

rem how to use : copy paste this script to root folder of pendrive

rem the script updates itself from the main source at my drive
cd "%~dp0"
if exist "%~dp0script-usbdrive-iso-autocopy-call-reposync.cmd" (
	robocopy "%automata_path%\others" "%~dp0." "script-usbdrive-iso-autocopy-call-reposync.cmd" /z /R:1 /W:1 /NDL /NJH /NJS /NS /NFL
)

rem run the tools repo
if not exist "%~dp0Tech" mkdir "%~dp0Tech"
if exist "%automata_path%\%automata_file%" (
	cd "%automata_path%"
	call "%automata_path%\%automata_file%"
)

REM 1. Mirror all ISOs from Source1 (root only)
if not exist "%destination_m%" mkdir "%destination_m%"
robocopy "%source_microsoft%" "%destination_m%" "*.iso" /purge /NDL /NJH /NJS /NS /Z /R:1 /W:1

REM 2. Mirror linuxmint ISOs from Source2
if not exist "%destination_l%" mkdir "%destination_l%"
robocopy "%source_linux%" "%destination_l%" "*linuxmint*.iso" /purge /NDL /NJH /NJS /NS /Z /R:1 /W:1

REM copy background to root
robocopy "%userprofile%\My Drive\Photos\Wallpaper" "%~dp0." "background.png" /purge /z /copy:d /dcopy:d /r:1 /w:1 /ndl /njs /njh

rem pause
timeout /t 3 >nul