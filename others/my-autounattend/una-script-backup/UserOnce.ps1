$scripts = @(
	{
		Get-AppxPackage -Name 'Microsoft.Windows.Ai.Copilot.Provider' | Remove-AppxPackage;
	};
	{
		[System.Diagnostics.EventLog]::WriteEntry( 'UnattendGenerator', "User '$env:USERNAME' has requested to unlock the Start menu layout.", [System.Diagnostics.EventLogEntryType]::Information, 1 );
	};
	{
		@(
		  Get-ChildItem -LiteralPath $env:USERPROFILE -Force -Recurse -Depth 2;
		) | Where-Object -FilterScript {
			$_.Attributes.HasFlag( [System.IO.FileAttributes]::ReparsePoint );
		} | Remove-Item -Force -Recurse -Verbose;
	};
	{
		Remove-Item -LiteralPath "${env:USERPROFILE}\Desktop\Microsoft Edge.lnk" -ErrorAction 'SilentlyContinue' -Verbose;
	};
	{
		Set-ItemProperty -LiteralPath 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -Type 'DWord' -Value 1;
	};
	{
		Set-ItemProperty -LiteralPath 'Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Type 'DWord' -Value 3;
	};
	{
		Set-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -Type 'DWord' -Value 3 -Force;
	};
	{
		Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Start' -Name 'VisiblePlaces' -Value $( [convert]::FromBase64String('hghzUqpRQ0Kfeyd2WEZZ1A==') ) -Type 'Binary';
	};
	{
		& 'C:\Windows\Setup\Scripts\SetColorTheme.ps1';
	};
	{
		Get-Process -Name 'explorer' -ErrorAction 'SilentlyContinue' | Where-Object -FilterScript {
			$_.SessionId -eq ( Get-Process -Id $PID ).SessionId;
		} | Stop-Process -Force;
	};
);

& {
  [float] $complete = 0;
  [float] $increment = 100 / $scripts.Count;
  foreach( $script in $scripts ) {
    Write-Progress -Activity 'Running scripts to configure this user account. Do not close this window.' -PercentComplete $complete;
    '*** Will now execute command «{0}».' -f $(
      $str = $script.ToString().Trim() -replace '\s+', ' ';
      $max = 100;
      if( $str.Length -le $max ) {
        $str;
      } else {
        $str.Substring( 0, $max - 1 ) + '…';
      }
    );
    $start = [datetime]::Now;
    & $script;
    '*** Finished executing command after {0:0} ms.' -f [datetime]::Now.Subtract( $start ).TotalMilliseconds;
    "`r`n" * 3;
    $complete += $increment;
  }
} *>&1 | Out-String -Width 1KB -Stream >> "$env:TEMP\UserOnce.log";