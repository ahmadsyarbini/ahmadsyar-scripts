# --------------------------------------------
# Self-elevating PowerShell script (hex string version)
# --------------------------------------------

# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch as admin
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# --------------------------------------------
# Configuration
# --------------------------------------------
$exePath = "C:\Program Files\Sublime Text\sublime_text.exe"

# Hex string input (just paste like "0F B6 51 05 83 F2 01")
$searchHex  = "0F B6 51 05 83 F2 01"
$replaceHex = "C6 41 05 01 B2 00 90"

# Convert hex strings to byte arrays
$searchBytes  = -split $searchHex  | ForEach-Object { [byte]("0x$_") }
$replaceBytes = -split $replaceHex | ForEach-Object { [byte]("0x$_") }

# Load EXE (fast)
$bytes = [System.IO.File]::ReadAllBytes($exePath)

# Replace first occurrence
$patternLength = $searchBytes.Length
$found = $false

for ($i = 0; $i -le $bytes.Length - $patternLength; $i++) {
    $match = $true
    for ($j = 0; $j -lt $patternLength; $j++) {
        if ($bytes[$i + $j] -ne $searchBytes[$j]) { 
            $match = $false
            break
        }
    }
    if ($match) {
        [Array]::Copy($replaceBytes, 0, $bytes, $i, $patternLength)
        $found = $true
        break
    }
}

# Write back if replaced
if ($found) {
    [System.IO.File]::WriteAllBytes($exePath, $bytes)
    Write-Host "Byte sequence replaced successfully."
} else {
    Write-Host "Byte sequence not found in the EXE."
}

# Optional: pause to see output if double-clicked
Start-Sleep -Seconds 3