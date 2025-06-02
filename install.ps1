$source = ".\settings.json"
$destination = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Path $source -Destination $destination -Force
Write-Host "Windows terminal configs updated."