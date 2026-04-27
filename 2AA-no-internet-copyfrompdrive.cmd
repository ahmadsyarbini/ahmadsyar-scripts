@echo off

set "local-tech=%userprofile%\asr-scripts\Tech"
set "local-local-tech=%userprofile%\asr-scripts\Local-Tech"
set "SourceWinScript=%userprofile%\My Drive\Documents\Tech"

rem safety check
if exist "%SourceWinScript%" (
	echo this script is invalid for this pc
	timeout /t 3 /nobreak >nul
	exit
)

rem condition = No internet, no local-tech folder, no my drive tech, has 1AA-reposync
if not exist "%local-tech%" (
	if not exist "%SourceWinScript%" (
		if exist "1AA-script-repo-automata.cmd" (
			mkdir "%local-tech%"
			robocopy "%~dp0." "%local-tech%" "*" /mir /copy:d /dcopy:d /r:1 /w:1 /njs /njh /ndl
			timeout /t 3 /nobreak >nul
			rem call "2AA-has-internet-deployment.cmd"
			rem pause
		)
	)
)

rem creating local-local-tech folder for shortcut
rem set Variables
set "TargetExe=C:\Windows\System32\cmd.exe"
set "TargetPath=%userprofile%\asr-scripts\Tech\script-everything-off.cmd"
set "TargetArgs=/c \"%TargetPath%\""
set "ShortcutPath=%local-local-tech%\script-everything-off.lnk"
rem Create shortcut
if not exist "%local-local-tech%" mkdir "%local-local-tech%"
powershell -NoProfile -Command ^
$WshShell = New-Object -ComObject WScript.Shell; ^
$Shortcut = $WshShell.CreateShortcut('%ShortcutPath%'); ^
$Shortcut.TargetPath = '%TargetExe%'; ^
$Shortcut.Arguments = '%TargetArgs%'; ^
$Shortcut.WorkingDirectory = Split-Path '%TargetPath%'; ^
$Shortcut.Save(); ^
$bytes = [System.IO.File]::ReadAllBytes('%ShortcutPath%'); ^
$bytes[21] = $bytes[21] -bor 0x20; ^
[System.IO.File]::WriteAllBytes('%ShortcutPath%', $bytes)
echo shortcut created
timeout /t 3 /nobreak >nul