# setup-aliases.ps1

# Verifica si el archivo de perfil existe
if (-not (Test-Path -Path $PROFILE)) {
    # Lo crea (y también las carpetas si no existen)
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
    Write-Host "Archivo de perfil creado en: $PROFILE"
}

# Contenido a agregar
$content = @'
function gs { git status }
function gc { git commit @args }
function gp { git push }
Set-Alias l Get-ChildItem
Set-Alias ll Get-ChildItem -Force
'@

# Agrega el contenido al final del perfil
Add-Content -Path $PROFILE -Value $content
Write-Host "Alias añadidos al perfil. Reinicia PowerShell para ver los cambios."
