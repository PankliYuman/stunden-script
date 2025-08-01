$pauseMinutenEingabe = Read-Host "Bitte gewuenschte Pause in Minuten eingeben (leer = 30)"
if ([string]::IsNullOrWhiteSpace($pauseMinutenEingabe)) {
    $pauseMinuten = 30
} else {
    $pauseMinuten = [int]$pauseMinutenEingabe
}

$sollArbeitszeit = New-TimeSpan -Hours 7 -Minutes 54

try {
    $ankunftszeit = [datetime]::ParseExact((Read-Host "Bitte Ankunftszeit eingeben (HH:mm, z.B. 07:30)"),"HH:mm",$null)
    
    $arbeitszeitEingabe = Read-Host "Bitte gewuenschte Arbeitszeit eingeben (HH:mm, leer = 07:54)"
    if ([string]::IsNullOrWhiteSpace($arbeitszeitEingabe)) {
        $arbeitszeitWunsch = $sollArbeitszeit
    } else {
        $arbeitszeitWunsch = [TimeSpan]::Parse($arbeitszeitEingabe)
    }
} catch { 
    Write-Host "Ungueltige Eingabe!" 
    exit 
}

$feierabendSoll = $ankunftszeit.AddMinutes($pauseMinuten).Add($sollArbeitszeit)
$feierabendWunsch = $ankunftszeit.AddMinutes($pauseMinuten).Add($arbeitszeitWunsch)

Write-Host "`nFeierabend (Sollzeit):    $($feierabendSoll.ToString('HH:mm'))"
Write-Host "Feierabend (Wunschzeit): $($feierabendWunsch.ToString('HH:mm'))"
Read-Host "`nZum Schliessen Enter druecken"