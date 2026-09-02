# Installs the skills in this repo to Claude Code and/or Codex user-level skills.
# Safe to re-run (overwrites with the repo versions).
param(
    [string]$Target = 'claude'
)

$ErrorActionPreference = 'Stop'

if ($Target -ne 'claude' -and $Target -ne 'codex' -and $Target -ne 'both') {
    Write-Output 'Usage: .\install.ps1 [-Target claude|codex|both]'
    exit 1
}

$homeDir = $env:USERPROFILE
if ([string]::IsNullOrEmpty($homeDir)) {
    $homeDir = [Environment]::GetFolderPath('UserProfile')
}

function Install-Skills([string]$Root) {
    New-Item -ItemType Directory -Force -Path $Root | Out-Null
    Get-ChildItem -Path (Join-Path $PSScriptRoot 'skills') -Directory | ForEach-Object {
        $dest = Join-Path $Root $_.Name
        New-Item -ItemType Directory -Force -Path $dest | Out-Null
        Copy-Item -Path (Join-Path $_.FullName '*') -Destination $dest -Recurse -Force
        "installed: $($_.Name)"
    }
}

if ($Target -eq 'claude' -or $Target -eq 'both') {
    Install-Skills (Join-Path $homeDir '.claude\skills')
}
if ($Target -eq 'codex' -or $Target -eq 'both') {
    Install-Skills (Join-Path $homeDir '.agents\skills')
}
