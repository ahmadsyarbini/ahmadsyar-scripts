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
winget install --id=64Gram.64Gram -e -h --source winget
winget install --id=7zip.7zip -e -h --source winget
winget install --id=9NKSQGP7F2NH -e -h --source msstore & rem whatsapp from msstore
winget install --id=abbodi1406.vcredist -e -h --source winget
winget install --id=anatawa12.ALCOM -e -h --source winget
winget install --id=AntibodySoftware.WizTree -e -h --source winget
winget install --id=AntSoftware.AntRenamer -e -h --source winget
winget install --id=Audacity.Audacity -e -h --source winget
winget install --id=AutoHotkey.AutoHotkey -e -h --source winget
winget install --id=ch.LosslessCut -e -h --source winget
winget install --id=CodecGuide.K-LiteCodecPack.Mega -e -h --source winget
winget install --id=CPUID.CPU-Z -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskInfo -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskMark -e -h --source winget
winget install --id=dev47apps.DroidCamOBSPlugin -e -h --source winget
winget install --id=Discord.Discord -e -h --source winget
winget install --id=EpicGames.EpicGamesLauncher -e -h --source winget
winget install --id=FlorianHeidenreich.Mp3tag -e -h --source winget
winget install --id=flux.flux -e -h --source winget
winget install --id=FrancisBanyikwa.MediaDownloader -e -h --source winget
winget install --id=Git.Git -e -h --source winget
winget install --id=Google.Chrome -e -h --source winget
winget install --id=Google.GoogleDrive -e -h --source winget
winget install --id=Google.PlatformTools -e -h --source winget
winget install --id=Guru3D.Afterburner -e -h --source winget
winget install --id=Guru3D.RTSS -e -h --source winget
winget install --id=Gyan.FFmpeg.Essentials -e -h --source winget
winget install --id=JavadMotallebi.NeatDownloadManager -e -h --source winget
winget install --id=Klocman.BulkCrapUninstaller -e -h --source winget
winget install --id=Microsoft.Sysinternals.Autologon -e -h --source winget
winget install --id=Modrinth.ModrinthApp -e -h --source winget
winget install --id=Mono.Mono -e -h --source winget
winget install --id=Mozilla.Firefox -e -h --source winget
winget install --id=namazso.PawnIO -e -h --source winget
winget install --id=NirSoft.SoundVolumeView -e -h --source winget
winget install --id=Nvidia.PhysX -e -h --source winget
winget install --id=OBSProject.OBSStudio -e -h --source winget
winget install --id=OpenJS.NodeJS.LTS -e -h --source winget
winget install --id=OpenRGB.OpenRGB -e -h --source winget
winget install --id=Overwolf.CurseForge -e -h --source winget
winget install --id=PowerSoftware.AnyBurn -e -h --source winget
winget install --id=Python.Python.3.7 -e -h --source winget
winget install --id=qBittorrent.qBittorrent -e -h --source winget
winget install --id=Rclone.Rclone -e -h --source winget
winget install --id=REALiX.HWiNFO -e -h --source winget
winget install --id=SublimeHQ.SublimeText.4 -e -h --source winget
winget install --id=Unity.UnityHub -e -h --source winget
winget install --id=Universal-Debloater-Alliance.uad-ng -e -h --source winget
winget install --id=Valve.Steam -e -h --source winget
winget install --id=Ventoy.Ventoy -e -h --source winget
winget install --id=ViRb3.wgcf -e -h --source winget
winget install --id=VRCX.VRCX -e -h --source winget
winget install --id=WireGuard.WireGuard -e -h --source winget
winget install --id=XMediaRecode.XMediaRecode -e -h --source winget
call "patcher-sublime-4200.cmd"
rem For pinning
winget pin add BlenderFoundation.Blender
winget pin add Discord.Discord
winget pin add EpicGames.EpicGamesLauncher
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
winget install --id=64Gram.64Gram -e -h --source winget
winget install --id=7zip.7zip -e -h --source winget
winget install --id=9NKSQGP7F2NH -e -h --source msstore & rem whatsapp ms store
winget install --id=abbodi1406.vcredist -e -h --source winget
winget install --id=AntibodySoftware.WizTree -e -h --source winget
winget install --id=AntSoftware.AntRenamer -e -h --source winget
winget install --id=CodecGuide.K-LiteCodecPack.Mega -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskInfo -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskMark -e -h --source winget
winget install --id=Discord.Discord -e -h --source winget
winget install --id=flux.flux -e -h --source winget
winget install --id=Google.Chrome -e -h --source winget
winget install --id=Google.GoogleDrive -e -h --source winget
winget install --id=Google.PlatformTools -e -h --source winget
winget install --id=JavadMotallebi.NeatDownloadManager -e -h --source winget
winget install --id=Klocman.BulkCrapUninstaller -e -h --source winget
winget install --id=Microsoft.Sysinternals.Autologon -e -h --source winget
winget install --id=Microsoft.WindowsTerminal -e -h --source winget
winget install --id=Mozilla.Firefox -e -h --source winget
winget install --id=REALiX.HWiNFO -e -h --source winget
winget install --id=SublimeHQ.SublimeText.4 -e -h --source winget
winget install --id=Universal-Debloater-Alliance.uad-ng -e -h --source winget
winget install --id=WireGuard.WireGuard -e -h --source winget
call "patcher-sublime-4200.cmd"
pause
goto end

:myserver
rem myserver set
echo installing myserver set
winget install --id=7zip.7zip -e -h --source winget
winget install --id=abbodi1406.vcredist -e -h --source winget
winget install --id=AntibodySoftware.WizTree -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskInfo -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskMark -e -h --source winget
winget install --id=DevelopedMethods.playit -e -h --source winget
winget install --id=Microsoft.DirectX -e -h --source winget
winget install --id=Microsoft.WindowsTerminal -e -h --source winget
winget install --id=REALiX.HWiNFO -e -h --source winget
winget install --id=SublimeHQ.SublimeText.4 -e -h --source winget
winget install --id=Valve.SteamCMD -e -h --source winget
call "patcher-sublime-4200.cmd"
pause
goto end

:stduser
rem for standard user
echo installing standard set
winget install --id=7zip.7zip -e -h --source winget
winget install --id=abbodi1406.vcredist -e -h --source winget
winget install --id=AntibodySoftware.WizTree -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskInfo -e -h --source winget
winget install --id=CrystalDewWorld.CrystalDiskMark -e -h --source winget
winget install --id=Klocman.BulkCrapUninstaller -e -h --source winget
winget install --id=Microsoft.DirectX -e -h --source winget
winget install --id=REALiX.HWiNFO -e -h --source winget
winget install --id=SublimeHQ.SublimeText.4 -e -h --source winget
pause
goto end

:uztechuser
rem for uztech user
echo installing uztech user set
winget install --id=abbodi1406.vcredist -e -h --source winget
winget install --id=Google.Chrome -e -h --source winget
winget install --id=Klocman.BulkCrapUninstaller -e -h --source winget
winget install --id=Microsoft.DirectX -e -h --source winget
winget install --id=Mozilla.Firefox -e -h --source winget
winget install --id=RARLab.WinRAR -e -h --source winget
winget install --id=REALiX.HWiNFO -e -h --source winget
winget install --id=VideoLAN.VLC -e -h --source winget
pause
goto end

:wten
rem for windows 10
powershell -NoProfile -Command "irm winget.pro | iex"
echo installing windows 10 set
winget install --id=7zip.7zip -e -h --source winget
winget install --id=Microsoft.WindowsTerminal -e -h --source winget
winget install --id=SublimeHQ.SublimeText.4 -e -h --source winget
call "patcher-sublime-4200.cmd"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ProductVersion /t REG_SZ /d "Windows 10" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersion /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersionInfo /t REG_SZ /d "22H2" /f
echo installing clover
cd "%~dp0"
call "%~dp0..\others\sc-installer-ejie.me.clover.cmd"
timeout /t 5 /nobreak >nul
call "%~dp0..\others\firewall-add-clover-ejieme.cmd"
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