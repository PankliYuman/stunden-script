$pauseMinuten = Read-Host "Bitte gib deine gewuenschte Pause in Minuten ein"
$sollArbeitszeit = New-TimeSpan -Hours 7 -Minutes 54
try {
    $ankunftszeit = [datetime]::ParseExact((Read-Host "Bitte Ankunftszeit eingeben (HH:mm, z.B. 07:30)"),"HH:mm",$null)
    $arbeitszeitWunsch = [TimeSpan]::Parse((Read-Host "Bitte gewuenschte Arbeitszeit eingeben (HH:mm, z.B. 08:30)"))
} catch { Write-Host "Ungueltige Eingabe!" ; exit }
$feierabendSoll = $ankunftszeit.AddMinutes($pauseMinuten).Add($sollArbeitszeit)
$feierabendWunsch = $ankunftszeit.AddMinutes($pauseMinuten).Add($arbeitszeitWunsch)
Write-Host "`nFeierabend (Sollzeit):    $($feierabendSoll.ToString('HH:mm'))"
Write-Host  "Feierabend (Wunschzeit): $($feierabendWunsch.ToString('HH:mm'))"
Read-Host "`nZum Schliessen Enter druecken..."
