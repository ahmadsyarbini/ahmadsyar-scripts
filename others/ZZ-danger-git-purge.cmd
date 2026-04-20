@echo off
setlocal
REM =========================================
REM FULL RESET + SHRINK .GIT FOR WINDOWS CMD
REM =========================================

REM set variable
set "GIT_PATH=%userprofile%\My Drive\Documents\Tech"

REM Change to your project directory
if not exist "%GIT_PATH%" (
    echo folder not found. exiting...
    timeout /t 5 /nobreak >nul
    exit /b
)
cd /d "%GIT_PATH%"

REM --- Delete existing .git folder ---
if exist ".git" (
    echo Deleting existing .git folder...
    rmdir /s /q ".git"
) else (
    echo No existing .git folder found.
)

REM --- Reinitialize git ---
echo Initializing new git repo...
git init

REM --- Add all files ---
echo Adding all files...
git add .

REM --- Create fresh commit ---
echo Creating initial commit...
git commit -m "fresh start (shrunk .git)"

REM --- Set branch to main ---
git branch -M main

REM --- Add remote if not already set ---
git remote get-url origin >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Adding remote...
    git remote add origin https://github.com/ahmadsyarbini/ahmadsyar-scripts.git
) else (
    echo Remote already exists.
)

REM --- Force push to overwrite remote ---
echo Force pushing to remote...
git push -u origin main --force

echo =========================================
echo Done! .git has been reset and pushed.
timeout /t 5 /nobreak >nul