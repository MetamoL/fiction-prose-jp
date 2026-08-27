# Installs the skills in this repo to ~/.claude/skills (Claude Code user-level skills).
# Safe to re-run (overwrites with the repo versions).
$ErrorActionPreference = 'Stop'
$dst = Join-Path ([Environment]::GetFolderPath('UserProfile')) '.claude\skills'
New-Item -ItemType Directory -Force -Path $dst | Out-Null
Get-ChildItem -Path (Join-Path $PSScriptRoot 'skills') -Directory | ForEach-Object {
    $dest = Join-Path $dst $_.Name
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $_.FullName '*') -Destination $dest -Recurse -Force
    "installed: $($_.Name)"
}
