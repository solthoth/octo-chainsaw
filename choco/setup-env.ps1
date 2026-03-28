#Requires -RunAsAdministrator

param(
    [ValidateSet("ALL", "SYS", "USER", "DEV")]
    [string]$Apps = "ALL",
    [switch]$SkipChocolatey
)

$ErrorActionPreference = "Stop"

function Install-Chocolatey {
    Write-Host "Installing Chocolatey..."
    & "$PSScriptRoot\install.ps1"
}

function Install-SystemApps {
    choco install curl -y
    choco install 7zip.install -y
}

function Install-DevApps {
    choco install git.install -y
    choco install nodejs.install -y
    choco install notepadplusplus.install -y
    choco install sourcetree -y
    choco install atom -y
    choco install linqpad -y
}

function Install-UserApps {
    choco install googlechrome -y
    choco install firefox -y
    choco install adobereader -y
}

function Install-Apps {
    if ($Apps -eq "ALL" -or $Apps -eq "SYS") { Install-SystemApps }
    if ($Apps -eq "ALL" -or $Apps -eq "USER") { Install-UserApps }
    if ($Apps -eq "ALL" -or $Apps -eq "DEV") { Install-DevApps }
}

# Entry point
if (-not $SkipChocolatey) {
    Install-Chocolatey
}

Write-Host "Installing apps ($Apps)..."
Install-Apps
Write-Host "Done."
