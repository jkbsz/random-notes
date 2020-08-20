# Keeps the screen from locking

$WShell = New-Object -com "Wscript.Shell"

while ($true) {
	Get-Date
	$WShell.sendkeys("{SCROLLLOCK}")
	Start-Sleep -Milliseconds 100
	$WShell.sendkeys("{SCROLLLOCK}")
	Start-Sleep -Seconds 240
}
