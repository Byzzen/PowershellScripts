# Define registry path and value name
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$regName = "Teams Autostart"
$regValue = 'powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Unrestricted -Command "Start-Process `"ms-teams.exe`" -ArgumentList `"msteams:work`"; Start-Sleep -Seconds 5; Get-Process `"ms-teams`" | % { $_.CloseMainWindow() | Out-Null }"'

# Create the registry entry
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type String

Write-Output "Registry entry '$regName' has been created successfully."
