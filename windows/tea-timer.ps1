# Counts minutes and beeps

$minutes = 5

$prompt = Read-Host "How many minutes [5]"
if ($prompt -match "^\d+$") {
	$minutes = $prompt
}

Write-Host -ForegroundColor Gray "$(Get-Date) $minutes minute timer"

For ($i=1; $i -le $minutes; $i++) {
	start-sleep (60);
	Write-Host -ForegroundColor Gray "$(Get-Date) $i / $minutes"
}

$Voice = new-object -com SAPI.SpVoice

while($true) {
	Write-Host -BackgroundColor Black -ForegroundColor Yellow "$(Get-Date) *** tea is ready ***"
	$Voice.Speak("beep bop beep bop, tea is ready") | Out-Null
	start-sleep (5);
}
