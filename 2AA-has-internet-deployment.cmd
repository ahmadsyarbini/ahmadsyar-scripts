@echo off
setlocal EnableDelayedExpansion
set "REPO_URL=https://github.com/ahmadsyarbini/ahmadsyar-scripts/archive/refs/heads/main.zip"
set "ZIP_FILE=%TEMP%\repo.zip"
set "EXTRACT_FOLDER=%TEMP%\repo-extract"
set "DEST_FOLDER=%USERPROFILE%\asr-scripts\Tech"
rem for creating localtech folder
set "local-local-tech=%userprofile%\asr-scripts\Local-Tech"

rem Clean temp
if exist "%EXTRACT_FOLDER%" rmdir /s /q "%EXTRACT_FOLDER%"
mkdir "%EXTRACT_FOLDER%"

rem Download the ZIP
echo Downloading repository...
curl -L "%REPO_URL%" -o "%ZIP_FILE%"
if errorlevel 1 (
    echo Failed to download repository.
    exit /b 1
)

rem Extract ZIP using Tar
echo Extracting repository...
tar -xf "%ZIP_FILE%" -C "%EXTRACT_FOLDER%"
if errorlevel 1 (
    echo Failed to extract repository.
    exit /b 1
)

rem Change directory into temp extract folder
cd /d "%EXTRACT_FOLDER%\ahmadsyar-scripts-main"

rem Robocopy to destination
echo Copying files to destination...
if not exist "%DEST_FOLDER%" mkdir "%DEST_FOLDER%"
robocopy "%EXTRACT_FOLDER%\ahmadsyar-scripts-main" "%DEST_FOLDER%" /mir /xf "*.zip" /njh /njs /ndl /copy:d /dcopy:d

rem Cleanup
cd /d "%DEST_FOLDER%"
rmdir /s /q "%EXTRACT_FOLDER%"
del /q "%ZIP_FILE%"

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
rem pause
timeout /t 3 /nobreak >nul