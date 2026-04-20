@echo off
:: Admin priv elevator
net session >nul 2>&1 || (powershell -c "Start-Process '%~f0' -Verb RunAs" & exit /b)
:: End of admin elevator
netsh advfirewall firewall delete rule name="Block Photoshop Outbound" dir=out
netsh advfirewall firewall delete rule name="Block Photoshop Inbound" dir=in
netsh advfirewall firewall delete rule name="Block Premiere Pro Outbound" dir=out
netsh advfirewall firewall delete rule name="Block Premiere Pro Inbound" dir=in
netsh advfirewall firewall delete rule name="Block Acrobat Outbound" dir=out
netsh advfirewall firewall delete rule name="Block Acrobat Inbound" dir=in
netsh advfirewall firewall delete rule name="Block Illustrator Outbound" dir=out
netsh advfirewall firewall delete rule name="Block Illustrator Inbound" dir=in
netsh advfirewall firewall add rule name="Block Photoshop Outbound" dir=out action=block program="C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe" enable=yes
netsh advfirewall firewall add rule name="Block Photoshop Inbound" dir=in action=block program="C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe" enable=yes
netsh advfirewall firewall add rule name="Block Premiere Pro Outbound" dir=out action=block program="C:\Program Files\Adobe\Adobe Premiere Pro 2025\Adobe Premiere Pro.exe" enable=yes
netsh advfirewall firewall add rule name="Block Premiere Pro Inbound" dir=in action=block program="C:\Program Files\Adobe\Adobe Premiere Pro 2025\Adobe Premiere Pro.exe" enable=yes
netsh advfirewall firewall add rule name="Block Acrobat Outbound" dir=out action=block program="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" enable=yes
netsh advfirewall firewall add rule name="Block Acrobat Inbound" dir=in action=block program="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" enable=yes
netsh advfirewall firewall add rule name="Block Illustrator Outbound" dir=out action=block program="C:\Program Files\Adobe\Adobe Illustrator 2025\Support Files\Contents\Windows\Illustrator.exe" enable=yes
netsh advfirewall firewall add rule name="Block Illustrator Inbound" dir=in action=block program="C:\Program Files\Adobe\Adobe Illustrator 2025\Support Files\Contents\Windows\Illustrator.exe" enable=yes
echo adobe firewall added
endlocal
timeout /t 3 /nobreak >nul
