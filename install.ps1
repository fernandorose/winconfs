function WindowsTerminalConfigs {
  param (
    [string] $source = ".\windows_terminal\settings.json",
    [string] $destination = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
  )

  try {
    Copy-Item -Path $source -Destination $destination -Force -ErrorAction Stop
    Write-Host -NoNewline "[Done]" -ForegroundColor Green
    Write-Host "Terminal" -ForegroundColor Blue
  }
  catch {
    Write-Host "[Error]TerminalConfigs: $_" -ForegroundColor Red
  }
  
}

function AliasesConfigs {
  param (
    [string] $content = @"
function .. { Set-Location .. }	
function c {code .}
function run {pnpm run dev}
function rstart {pnpm run start}
function dcu {docker-compose up}
function dcd {docker-compose down -v}
function add {pnpm add @args}
function cl {git clone @args}
function ginit {git init}
function pinit {pnpm init}
function gc {git checkout @args}
function gcb {git checkout -b @args}
function gs { git status }
function gp { git push }
function gcl { git clone @args }
Set-Alias l Get-ChildItem
Set-Alias ll Get-ChildItem -Force
"@
  )

  if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
    Write-Host "⚠️ Profile file created in: $PROFILE" -ForegroundColor Red
  }

  Set-Content -Path $PROFILE -Value $content
  Write-Host -NoNewline "[Done]" -ForegroundColor Green
  Write-Host "Aliases" -ForegroundColor Blue
  
}

function WeztermConfigs {
  param (
    [string] $source = ".\wezterm\.wezterm.lua",
    [string] $destination = "$env:USERPROFILE"
  )

  try {
    Copy-Item -Path $source -Destination $destination -Force -ErrorAction Stop
    Write-Host -NoNewline "[Done]" -ForegroundColor Green
    Write-Host "Wezterminal" -ForegroundColor Blue

  }
  catch {
    Write-Host "[Error]Aliases: $_" -ForegroundColor Red
  }
}

function Main {
  WindowsTerminalConfigs
  AliasesConfigs
  WeztermConfigs
  Write-Host "[All configs updated]" -ForegroundColor Green
}

Main