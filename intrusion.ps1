# intrusion.ps1 – sieht aus als wirst du gerade gehackt
# Erzeugt eine "Du wirst gerade gehackt"-Show auf dem Ziel-PC
 
# 1. Fake-Hacking: Windows-Console öffnen und nach "Hack" suchen
Start-Process notepad
Start-Sleep -Milliseconds 500
(Get-Process -Name "notepad").MainWindowTitle = "User: administrator"
Get-Process -Name "notepad" | ForEach-Object {
    Write-Output "> running shell..."
    Start-Sleep -Milliseconds 200
    Write-Output "> connecting to target..."
    Start-Sleep -Milliseconds 200
    Write-Output "> cracking passwords..."
    Start-Sleep -Milliseconds 500
    Write-Output "> root access granted"
    Start-Sleep -Milliseconds 300
    $_.CloseMainWindow()
}
 
# 2. Echte Mausbewegung: "Deine Hand" bewegt sich zum Klick
# Einfacher Weg: Startet Notepad, bewegt die Maus und klickt auf "Neu"
Start-Process notepad
 
# Kurze Pause für das Öffnen des Fensters
Start-Sleep -Milliseconds 1500
 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Windows.Input
 
$desktop = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$centerX = $desktop.Left + ($desktop.Width / 2)
$centerY = $desktop.Top + ($desktop.Height / 2)
 
# Simuliere die Bewegung: Von links oben in die Mitte
$moveX = $desktop.Left + 100
$moveY = $desktop.Top + 100
 
# Methode zum Bewegen der Maus (für Windows 10/11)
try {
    # Vorbereitete Bewegung
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($centerX, $centerY)
 
    # Simuliere Klick auf den Button "Neu" (ca. in der Nähe der Mitte)
    Start-Sleep -Milliseconds 500
    [System.Windows.Forms.Cursor]::Click()
}
catch {
    # Fallback: Standard-Klick an der Mitte
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($centerX, $centerY)
    Start-Sleep -Milliseconds 500
    [System.Windows.Forms.Cursor]::Click()
}
 
Write-Host "Deine Hand hat gerade geklickt."
