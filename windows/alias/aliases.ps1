# setup-aliases.ps1

# Verifica si el archivo de perfil existe
if (-not (Test-Path -Path $PROFILE)) {
    # Lo crea (y también las carpetas si no existen)
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
    Write-Host "Archivo de perfil creado en: $PROFILE"
}

# Contenido que se escribirá (reemplazará lo anterior)
$content = @'
function gs { git status }
function gc { git commit @args }
function gp { git push }
function .. { Set-Location .. }	
function c {code .}
function run {pnpm run dev}
function start {pnpm run start}
function dcu {docker-compose up}
function dcd {docker-compose down -v}
function add {pnpm add @args}
Set-Alias l Get-ChildItem
Set-Alias ll Get-ChildItem -Force
'@

# Reemplaza el contenido del perfil con el nuevo
Set-Content -Path $PROFILE -Value $content
Write-Host "Alias escritos en el perfil. Reinicia PowerShell para ver los cambios."
