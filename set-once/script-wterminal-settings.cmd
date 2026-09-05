@echo off
set "WT=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

if not exist "%WT%" mkdir "%WT%"

>"%WT%\settings.json" (
echo {
echo     "$help": "https://aka.ms/terminal-documentation",
echo     "$schema": "https://aka.ms/terminal-profiles-schema",
echo     "actions": [],
echo     "copyFormatting": "none",
echo     "copyOnSelect": false,
echo     "defaultProfile": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
echo     "disabledProfileSources": [
echo         "Windows.Terminal.Wsl",
echo         "Windows.Terminal.VisualStudio",
echo         "Windows.Terminal.PowershellCore",
echo         "Windows.Terminal.Azure"
echo     ],
echo     "initialPosition": "40,220",
echo     "keybindings": [
echo         {
echo             "id": "Terminal.CopyToClipboard",
echo             "keys": "ctrl+c"
echo         },
echo         {
echo             "id": "Terminal.PasteFromClipboard",
echo             "keys": "ctrl+v"
echo         },
echo         {
echo             "id": "Terminal.DuplicatePaneAuto",
echo             "keys": "alt+shift+d"
echo         }
echo     ],
echo     "newTabMenu": [
echo         {
echo             "type": "remainingProfiles"
echo         }
echo     ],
echo     "profiles": {
echo         "defaults": {
echo             "font": {
echo                 "size": 13,
echo                 "weight": "light"
echo             }
echo         },
echo         "list": [
echo             {
echo                 "commandline": "%%SystemRoot%%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
echo                 "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
echo                 "hidden": false,
echo                 "name": "Windows PowerShell"
echo             },
echo             {
echo                 "commandline": "%%SystemRoot%%\\System32\\cmd.exe",
echo                 "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
echo                 "hidden": false,
echo                 "name": "Command Prompt"
echo             }
echo         ]
echo     },
echo     "schemes": [],
echo     "themes": [],
echo     "windowingBehavior": "useAnyExisting"
echo }
)

echo settings written
timeout /t 3 /nobreak >nul