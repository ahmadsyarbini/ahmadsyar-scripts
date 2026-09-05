@echo off
setlocal
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
Title "Winget batch Installer"
echo Press 1 for mypc
echo Press 2 for mylaptop
echo Press 3 for myserver
echo Press 4 for standard user
echo Press 5 for uztechuser
echo Press 6 for windows 10
echo Press 7 to do nothing
choice /c:1234567 /D:7 /T:30
if %errorlevel% == 1 goto mypc
if %errorlevel% == 2 goto mylaptop
if %errorlevel% == 3 goto myserver
if %errorlevel% == 4 goto stduser
if %errorlevel% == 5 goto uztechuser
if %errorlevel% == 6 goto wten
if %errorlevel% == 7 goto nothing

:mypc
rem mypc set
echo installing mypc set
winget install -e -h --source=msstore --id=9NKSQGP7F2NH & rem whatsapp msoft store
winget install -e -h --source=winget --id=64Gram.64Gram
winget install -e -h --source=winget --id=7zip.7zip
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=anatawa12.ALCOM
winget install -e -h --source=winget --id=AnInsomniacy.MotrixNext
winget install -e -h --source=winget --id=AntibodySoftware.WizTree
winget install -e -h --source=winget --id=AntSoftware.AntRenamer
winget install -e -h --source=winget --id=Audacity.Audacity
winget install -e -h --source=winget --id=AutoHotkey.AutoHotkey
winget install -e -h --source=winget --id=ch.LosslessCut
winget install -e -h --source=winget --id=CodecGuide.K-LiteCodecPack.Standard
winget install -e -h --source=winget --id=CPUID.CPU-Z
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskInfo
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskMark
winget install -e -h --source=winget --id=dev47apps.DroidCamOBSPlugin
winget install -e -h --source=winget --id=Discord.Discord
winget install -e -h --source=winget --id=EpicGames.EpicGamesLauncher
winget install -e -h --source=winget --id=FlorianHeidenreich.Mp3tag
winget install -e -h --source=winget --id=flux.flux
winget install -e -h --source=winget --id=FrancisBanyikwa.MediaDownloader
winget install -e -h --source=winget --id=Git.Git
winget install -e -h --source=winget --id=Google.Chrome
winget install -e -h --source=winget --id=Google.GoogleDrive
winget install -e -h --source=winget --id=Google.PlatformTools
winget install -e -h --source=winget --id=Guru3D.Afterburner
winget install -e -h --source=winget --id=Guru3D.RTSS
winget install -e -h --source=winget --id=Gyan.FFmpeg.Essentials
winget install -e -h --source=winget --id=Klocman.BulkCrapUninstaller
winget install -e -h --source=winget --id=Microsoft.Sysinternals.Autologon
winget install -e -h --source=winget --id=Microsoft.WindowsTerminal
winget install -e -h --source=winget --id=Mono.Mono
winget install -e -h --source=winget --id=Mozilla.Firefox
winget install -e -h --source=winget --id=namazso.PawnIO
winget install -e -h --source=winget --id=NirSoft.SoundVolumeView
winget install -e -h --source=winget --id=OBSProject.OBSStudio
winget install -e -h --source=winget --id=OpenRGB.OpenRGB
winget install -e -h --source=winget --id=PowerSoftware.AnyBurn
winget install -e -h --source=winget --id=Rclone.Rclone
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=RubyInstallerTeam.RubyWithDevKit.3.4
winget install -e -h --source=winget --id=Rufus.Rufus
winget install -e -h --source=winget --id=SublimeHQ.SublimeText.4
winget install -e -h --source=winget --id=TechPowerUp.GPU-Z
winget install -e -h --source=winget --id=TechPowerUp.NVCleanstall
winget install -e -h --source=winget --id=Unity.UnityHub
winget install -e -h --source=winget --id=Universal-Debloater-Alliance.uad-ng
winget install -e -h --source=winget --id=Valve.Steam
winget install -e -h --source=winget --id=Ventoy.Ventoy
winget install -e -h --source=winget --id=ViRb3.wgcf
winget install -e -h --source=winget --id=VRCX.VRCX
winget install -e -h --source=winget --id=WireGuard.WireGuard
winget install -e -h --source=winget --id=XMediaRecode.XMediaRecode
call "patcher-sublime-4200.cmd"
rem For pinning
winget pin add BlenderFoundation.Blender
winget pin add Discord.Discord
winget pin add EpicGames.EpicGamesLauncher
winget pin add EpicGames.EpicOnlineServices
winget pin add Guru3D.RTSS
winget pin add Unity.Unity.2022
winget pin add Unity.UnityHub
winget pin add Valve.Steam
winget pin add VRCX.VRCX
pause
goto end

:mylaptop
rem mylaptop set
echo installing mylaptop set
winget install -e -h --source=msstore --id=9NKSQGP7F2NH & rem whatsapp ms store
winget install -e -h --source=winget --id=64Gram.64Gram
winget install -e -h --source=winget --id=7zip.7zip
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=AnInsomniacy.MotrixNext
winget install -e -h --source=winget --id=AntibodySoftware.WizTree
winget install -e -h --source=winget --id=AntSoftware.AntRenamer
winget install -e -h --source=winget --id=CodecGuide.K-LiteCodecPack.Standard
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskInfo
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskMark
winget install -e -h --source=winget --id=Discord.Discord
winget install -e -h --source=winget --id=flux.flux
winget install -e -h --source=winget --id=Google.Chrome
winget install -e -h --source=winget --id=Google.GoogleDrive
winget install -e -h --source=winget --id=Google.PlatformTools
winget install -e -h --source=winget --id=Klocman.BulkCrapUninstaller
winget install -e -h --source=winget --id=Microsoft.Sysinternals.Autologon
winget install -e -h --source=winget --id=Microsoft.WindowsTerminal
winget install -e -h --source=winget --id=Mozilla.Firefox
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=SublimeHQ.SublimeText.4
winget install -e -h --source=winget --id=Universal-Debloater-Alliance.uad-ng
winget install -e -h --source=winget --id=WireGuard.WireGuard
call "patcher-sublime-4200.cmd"
pause
goto end

:myserver
rem myserver set
echo installing myserver set
winget install -e -h --source=winget --id=7zip.7zip
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=AntibodySoftware.WizTree
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskInfo
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskMark
winget install -e -h --source=winget --id=Microsoft.DirectX
winget install -e -h --source=winget --id=Microsoft.Sysinternals.Autologon
winget install -e -h --source=winget --id=Microsoft.WindowsTerminal
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=SublimeHQ.SublimeText.4
winget install -e -h --source=winget --id=Valve.SteamCMD
call "patcher-sublime-4200.cmd"
pause
goto end

:stduser
rem for standard user
echo installing standard set
winget install -e -h --source=winget --id=7zip.7zip
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=AntibodySoftware.WizTree
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskInfo
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskMark
winget install -e -h --source=winget --id=Klocman.BulkCrapUninstaller
winget install -e -h --source=winget --id=Microsoft.DirectX
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=SublimeHQ.SublimeText.4
pause
goto end

:uztechuser
rem for uztech user
echo installing uztech user set
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=Google.Chrome
winget install -e -h --source=winget --id=Klocman.BulkCrapUninstaller
winget install -e -h --source=winget --id=Microsoft.DirectX
winget install -e -h --source=winget --id=Mozilla.Firefox
winget install -e -h --source=winget --id=RARLab.WinRAR
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=VideoLAN.VLC
pause
goto end

:wten
rem for windows 10 my server
powershell -NoProfile -Command "irm winget.pro | iex"
echo wait 10 seconds
timeout /t 10 /nobreak >nul
echo installing windows 10 set
winget install -e -h --source=winget --id=7zip.7zip
winget install -e -h --source=winget --id=abbodi1406.vcredist
winget install -e -h --source=winget --id=AntibodySoftware.WizTree
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskInfo
winget install -e -h --source=winget --id=CrystalDewWorld.CrystalDiskMark
winget install -e -h --source=winget --id=Microsoft.DirectX
winget install -e -h --source=winget --id=Microsoft.WindowsTerminal
winget install -e -h --source=winget --id=REALiX.HWiNFO
winget install -e -h --source=winget --id=SublimeHQ.SublimeText.4
winget install -e -h --source=winget --id=Valve.SteamCMD
cd "%~dp0."
call "patcher-sublime-4200.cmd"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ProductVersion /t REG_SZ /d "Windows 10" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersion /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersionInfo /t REG_SZ /d "22H2" /f
echo installing clover
cd "%~dp0."
call "%~dp0..\others\sc-installer-ejie.me.clover.cmd"
timeout /t 5 /nobreak >nul
call "%~dp0..\others\firewall-add-clover-ejieme.cmd"
timeout /t 5 /nobreak >nul
call "%~dp0..\others\sc-downloader-portwarp.cmd"
call "%~dp0..\others\sc-path-adding-pwrp-7z.cmd"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& ([ScriptBlock]::Create((irm https://get.activated.win))) /Z-ESU"
pause
goto end

:nothing
rem do nothing
echo nothing is done
pause
goto end

rem simpanan vcredist
rem winget install --id=Microsoft.VCRedist.2005.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2005.x86 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2008.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2008.x86 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2010.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2010.x86 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2012.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2012.x86 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2013.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2013.x86 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2015+.x64 -e -h --source winget
rem winget install --id=Microsoft.VCRedist.2015+.x86 -e -h --source winget

:end
exit