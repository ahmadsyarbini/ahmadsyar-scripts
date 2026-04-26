@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator

:: Query Malaysia Standard Time and update system clock
echo Querying Malaysia local time (GMT+8)...

powershell -NoProfile -Command ^
"$maxAttempts = 3; $attempt = 0; $success = $false;^
while (-not $success -and $attempt -lt $maxAttempts) {^
    try {^
        $attempt++;^
        Write-Host 'Attempt' $attempt 'to sync time...';^
        $response = Invoke-RestMethod -Uri 'https://timeapi.io/api/Time/current/zone?timeZone=Asia/Kuala_Lumpur';^
        $localTime = Get-Date $response.dateTime;^
        Set-Date -Date $localTime;^
        Write-Host 'System time set to:' $localTime;^
        $success = $true^
    } catch {^
        Write-Host 'Attempt' $attempt 'failed:' $_;^
        if ($attempt -lt $maxAttempts) { Start-Sleep -Seconds 5 }^
    }^
}^
if (-not $success) { Write-Host 'All attempts failed. System time not updated.' }"

echo Time resync attempt complete.
timeout /t 5 /nobreak >nul
