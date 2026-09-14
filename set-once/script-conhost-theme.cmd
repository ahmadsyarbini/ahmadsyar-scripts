@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
echo Applying console configuration...

REM ===== Base HKCU\Console =====
reg add "HKCU\Console" /v ColorTable00 /t REG_DWORD /d 0x000c0c0c /f
reg add "HKCU\Console" /v ColorTable01 /t REG_DWORD /d 0x00da3700 /f
reg add "HKCU\Console" /v ColorTable02 /t REG_DWORD /d 0x000ea113 /f
reg add "HKCU\Console" /v ColorTable03 /t REG_DWORD /d 0x00dd963a /f
reg add "HKCU\Console" /v ColorTable04 /t REG_DWORD /d 0x001f0fc5 /f
reg add "HKCU\Console" /v ColorTable05 /t REG_DWORD /d 0x00981788 /f
reg add "HKCU\Console" /v ColorTable06 /t REG_DWORD /d 0x00009cc1 /f
reg add "HKCU\Console" /v ColorTable07 /t REG_DWORD /d 0x00cccccc /f
reg add "HKCU\Console" /v ColorTable08 /t REG_DWORD /d 0x00767676 /f
reg add "HKCU\Console" /v ColorTable09 /t REG_DWORD /d 0x00ff783b /f
reg add "HKCU\Console" /v ColorTable10 /t REG_DWORD /d 0x000cc616 /f
reg add "HKCU\Console" /v ColorTable11 /t REG_DWORD /d 0x00d6d661 /f
reg add "HKCU\Console" /v ColorTable12 /t REG_DWORD /d 0x005648e7 /f
reg add "HKCU\Console" /v ColorTable13 /t REG_DWORD /d 0x009e00b4 /f
reg add "HKCU\Console" /v ColorTable14 /t REG_DWORD /d 0x00a5f1f9 /f
reg add "HKCU\Console" /v ColorTable15 /t REG_DWORD /d 0x00f2f2f2 /f

reg add "HKCU\Console" /v CtrlKeyShortcutsDisabled /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v CursorColor /t REG_DWORD /d 0xffffffff /f
reg add "HKCU\Console" /v CursorSize /t REG_DWORD /d 0x19 /f
reg add "HKCU\Console" /v DefaultBackground /t REG_DWORD /d 0xffffffff /f
reg add "HKCU\Console" /v DefaultForeground /t REG_DWORD /d 0xffffffff /f
reg add "HKCU\Console" /v EnableColorSelection /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v ExtendedEditKey /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v ExtendedEditKeyCustom /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v FaceName /t REG_SZ /d "Cascadia Mono Light" /f
reg add "HKCU\Console" /v FilterOnPaste /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v FontFamily /t REG_DWORD /d 0x36 /f
reg add "HKCU\Console" /v FontSize /t REG_DWORD /d 0x00140000 /f
reg add "HKCU\Console" /v FontWeight /t REG_DWORD /d 0x12c /f
reg add "HKCU\Console" /v ForceV2 /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v FullScreen /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v HistoryBufferSize /t REG_DWORD /d 0x32 /f
reg add "HKCU\Console" /v HistoryNoDup /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v InsertMode /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v LineSelection /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v LineWrap /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v LoadConIme /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v NumberOfHistoryBuffers /t REG_DWORD /d 0x4 /f
reg add "HKCU\Console" /v PopupColors /t REG_DWORD /d 0xf5 /f
reg add "HKCU\Console" /v QuickEdit /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v ScreenBufferSize /t REG_DWORD /d 0x23290078 /f
reg add "HKCU\Console" /v ScreenColors /t REG_DWORD /d 0x7 /f
reg add "HKCU\Console" /v ScrollScale /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v TerminalScrolling /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v TrimLeadingZeros /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v WindowAlpha /t REG_DWORD /d 0xff /f
reg add "HKCU\Console" /v WindowSize /t REG_DWORD /d 0x001e0078 /f
reg add "HKCU\Console" /v WordDelimiters /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v CurrentPage /t REG_DWORD /d 0x1 /f
reg add "HKCU\Console" /v CursorType /t REG_DWORD /d 0x0 /f
reg add "HKCU\Console" /v InterceptCopyPaste /t REG_DWORD /d 0x0 /f

REM ===== %%Startup =====
reg add "HKCU\Console\%%Startup" /v DelegationConsole /t REG_SZ /d "{2EACA947-7F5F-4CFA-BA87-8F7FBEEFBE69}" /f
reg add "HKCU\Console\%%Startup" /v DelegationTerminal /t REG_SZ /d "{E12CFF52-A866-4C77-9A90-F570A7AA2C6B}" /f

REM ===== PowerShell System32 =====
set "PS1=HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe"

reg add "%PS1%" /v ColorTable05 /t REG_DWORD /d 0x00562401 /f
reg add "%PS1%" /v ColorTable06 /t REG_DWORD /d 0x00f0edee /f
reg add "%PS1%" /v FaceName /t REG_SZ /d "Lucida Console" /f
reg add "%PS1%" /v FontFamily /t REG_DWORD /d 0x36 /f
reg add "%PS1%" /v FontWeight /t REG_DWORD /d 0x190 /f
reg add "%PS1%" /v PopupColors /t REG_DWORD /d 0xf3 /f
reg add "%PS1%" /v QuickEdit /t REG_DWORD /d 0x1 /f
reg add "%PS1%" /v ScreenBufferSize /t REG_DWORD /d 0x0bb80078 /f
reg add "%PS1%" /v ScreenColors /t REG_DWORD /d 0x56 /f
reg add "%PS1%" /v WindowSize /t REG_DWORD /d 0x00320078 /f

REM ===== PowerShell SysWOW64 =====
set "PS2=HKCU\Console\%%SystemRoot%%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe"

reg add "%PS2%" /v ColorTable05 /t REG_DWORD /d 0x00562401 /f
reg add "%PS2%" /v ColorTable06 /t REG_DWORD /d 0x00f0edee /f
reg add "%PS2%" /v FaceName /t REG_SZ /d "Lucida Console" /f
reg add "%PS2%" /v FontFamily /t REG_DWORD /d 0x36 /f
reg add "%PS2%" /v FontWeight /t REG_DWORD /d 0x190 /f
reg add "%PS2%" /v PopupColors /t REG_DWORD /d 0xf3 /f
reg add "%PS2%" /v QuickEdit /t REG_DWORD /d 0x1 /f
reg add "%PS2%" /v ScreenBufferSize /t REG_DWORD /d 0x0bb80078 /f
reg add "%PS2%" /v ScreenColors /t REG_DWORD /d 0x56 /f
reg add "%PS2%" /v WindowSize /t REG_DWORD /d 0x00320078 /f

REM ===== Git Bash =====
reg add "HKCU\Console\Git Bash" /v FaceName /t REG_SZ /d "Lucida Console" /f
reg add "HKCU\Console\Git Bash" /v FontFamily /t REG_DWORD /d 0x36 /f
reg add "HKCU\Console\Git Bash" /v FontSize /t REG_DWORD /d 0x000e0000 /f
reg add "HKCU\Console\Git Bash" /v FontWeight /t REG_DWORD /d 0x190 /f

REM ===== Git CMD =====
reg add "HKCU\Console\Git CMD" /v FaceName /t REG_SZ /d "Lucida Console" /f
reg add "HKCU\Console\Git CMD" /v FontFamily /t REG_DWORD /d 0x36 /f
reg add "HKCU\Console\Git CMD" /v FontSize /t REG_DWORD /d 0x000e0000 /f
reg add "HKCU\Console\Git CMD" /v FontWeight /t REG_DWORD /d 0x190 /f

echo Done.
timeout /t 3 /nobreak