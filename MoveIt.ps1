'Stopping the screensaver from running'

$height = (((Get-WmiObject -Class Win32_VideoController).VideoModeDescription  -split '\n')[0]  -split ' ')[2]
$width = (((Get-WmiObject -Class Win32_VideoController).VideoModeDescription  -split '\n')[0]  -split ' ')[0]


$startX = $width/10
$startY = $height/10


$maxX = $width - $startX
$maxY = $height - $startY


Add-Type -AssemblyName System.Windows.Forms
$Pos = 0,0
  $x = ($pos.X) + $startX
  $y = ($pos.Y) + $startY
 [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
 
while ($true)
{
  $Pos = [System.Windows.Forms.Cursor]::Position
  $x = $maxX
  $y = ($pos.Y) + 1
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  Write-Host $x,$y
  [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
  Start-Sleep -Seconds 30
  $Pos = [System.Windows.Forms.Cursor]::Position
  $x = $startX
  $y = ($pos.Y)
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  Write-Host $x,$y $maxY
  if ($y -ge $maxY) {
		Write-Host "Reseeting"
		$Pos = 0,0
		$x = ($pos.X) + $startX
		$y = ($pos.Y) + $startY
		[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
		$Pos = [System.Windows.Forms.Cursor]::Position
		$x = $maxX
		$y = ($pos.Y) + 1
		[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
	}
  [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
  Start-Sleep -Seconds 30
}
