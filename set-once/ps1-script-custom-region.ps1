# ================================================
# Custom Regional Format Fix Script (en-US)
# ================================================

$reg = "HKCU:\Control Panel\International"

# --- Date formats ---
Set-ItemProperty $reg -Name sShortDate -Value "dd-MMM-yyyy"        # e.g. 25-Aug-2025
Set-ItemProperty $reg -Name sLongDate  -Value "dddd, dd MMMM yyyy" # e.g. Monday, 25 August 2025

# --- Time formats ---
Set-ItemProperty $reg -Name sShortTime  -Value "HH:mm"             # e.g. 14:05
Set-ItemProperty $reg -Name sTimeFormat -Value "H:mm:ss"           # e.g. 14:05:09
Set-ItemProperty $reg -Name iTime       -Value "1"                 # 24-hour clock

# --- Week start ---
# (0=Mon,1=Tue,...,6=Sun)
Set-ItemProperty $reg -Name iFirstDayOfWeek -Value "6"

# --- Digits ---
Set-ItemProperty $reg -Name sNativeDigits -Value "0123456789"

# --- Apply to current session ---
$c = [System.Globalization.CultureInfo]::GetCultureInfo("en-US").Clone()
$c.DateTimeFormat.ShortDatePattern = "dd-MMM-yyyy"
$c.DateTimeFormat.LongDatePattern  = "dddd, dd MMMM yyyy"
$c.DateTimeFormat.ShortTimePattern = "HH:mm"
$c.DateTimeFormat.LongTimePattern  = "H:mm:ss"
$c.DateTimeFormat.FirstDayOfWeek   = [System.DayOfWeek]::Sunday
$c.NumberFormat.NativeDigits       = @('0','1','2','3','4','5','6','7','8','9')
[System.Threading.Thread]::CurrentThread.CurrentCulture  = $c
[System.Threading.Thread]::CurrentThread.CurrentUICulture = $c

# --- Show results ---
Write-Host "Regional format has been set to:"
Write-Host "Short Date : $(Get-Date -Format 'dd-MMM-yyyy')"
Write-Host "Long  Date : $(Get-Date -Format 'dddd, dd MMMM yyyy')"
Write-Host "Short Time : $(Get-Date -Format 'HH:mm')"
Write-Host "Long  Time : $(Get-Date -Format 'H:mm:ss')"
Write-Host "First Day of Week : Sunday"