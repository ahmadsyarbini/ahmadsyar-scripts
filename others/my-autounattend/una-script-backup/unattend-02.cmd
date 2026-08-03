:: make uac using cmd - sudah add - jadi

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

:: taskbar never combine and dont show label - jadi
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f
::explorer win 11 compact mode - jadi
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v UseCompactMode /t REG_DWORD /d 1 /f

:: system notification Disable "Suggest ways to get the most out of Windows" - jadi
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f

:: accessibility Always show scrollbars set to ON - sudah add - jadi
reg add "HKCU\Control Panel\Accessibility" /v DynamicScrollbars /t REG_DWORD /d 0 /f

:: cross device resume - sudah add - jadi
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration" /v IsResumeAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CrossDeviceResume\Configuration" /v IsOneDriveResumeAllowed /t REG_DWORD /d 0 /f

:: Edge stuff - jadi
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AllowGamesMenu /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AutoImportAtFirstRun /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ConfigureDoNotTrack /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v CryptoWalletEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DefaultBrowserSettingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DiagnosticData /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EdgeAssetDeliveryServiceEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EdgeCollectionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EdgeShoppingAssistantEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HideFirstRunExperience /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HubsSidebarEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ImportBrowserSettings /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ImportExtensions /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ImportFavorites /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ImportHistory /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ImportSavedPasswords /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v MicrosoftEdgeInsiderPromotionEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowPDFDefaultRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v UserFeedbackAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v WalletDonationEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v CreateDesktopShortcutDefault /t REG_DWORD /d 0 /f

:: location setting big switch - jadi
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d Allow /f

:: windows using hardware sensor to locate like gps - jadi
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f

:: location service background apps - jadi
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f

:: disable background apps - jadi
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f

:: disable Malicious Software Removal Tool MRT
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontReportInfectionInformation /t REG_DWORD /d 1 /f

:: Disable Gamebar
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f

::MS Edge ext - uOLite - new blank tab
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /v 1 /t REG_SZ /d "cimighlppcgcoapaliogpjjdehbnofhn;https://edge.microsoft.com/extensionwebstorebase/v1/crx" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /v 2 /t REG_SZ /d "pfbmpcgfjncjakgfpddijlbdpjnhnfem;https://edge.microsoft.com/extensionwebstorebase/v1/crx" /f

::MS Edge disable copilot chat
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "Microsoft365CopilotChatIconEnabled" /t REG_DWORD /d 0 /f

::write note to desktop
(
echo To disable forced MS Edge settings delete the following registry keys:
echo.
echo ::MS Edge extesions 1 UOlite 2 Blank New tab
echo.
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /v 1 /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" /v 2 /f
echo.
echo ::MS Edge copilot chat
echo.
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v Microsoft365CopilotChatIconEnabled /f
echo.
echo :: Other MS Edge stuff
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AutoImportAtFirstRun" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "CryptoWalletEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultBrowserSettingEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeAssetDeliveryServiceEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ImportBrowserSettings" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ImportExtensions" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ImportFavorites" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ImportHistory" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ImportSavedPasswords" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MicrosoftEdgeInsiderPromotionEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowMicrosoftRewards" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WalletDonationEnabled" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /f
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "CreateDesktopShortcutDefault" /f
echo.
echo ::Delete this reg key to enable Windows Defender tray icon
echo.
echo reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v "HideSystray" /f
echo.
echo ::Delete this task in task scheduler to disable All Tray Icon Visible on Windows 11
echo.
echo schtasks /delete /tn "ShowAllTrayIcons" /f

) > "%USERPROFILE%\Desktop\notes.txt"