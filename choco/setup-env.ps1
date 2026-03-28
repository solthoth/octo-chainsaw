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
    # Utilities
    choco install curl -y
    choco install 7zip.install -y
    choco install tree -y
    choco install libsodium -y
}

function Install-DevApps {
    # Editors / IDE helpers
    choco install notepadplusplus.install -y
    choco install atom -y
    choco install linqpad -y
    choco install vscode -y

    # Version control
    choco install git.install -y
    choco install gh -y
    choco install sourcetree -y

    # Languages / runtimes
    choco install golang -y
    choco install nodejs.install -y
    choco install nvm -y

    # Cloud & infrastructure
    choco install azure-cli -y
    choco install terraform -y
    choco install opentofu -y
    choco install kubernetes-cli -y
    choco install kustomize -y
    choco install kind -y
    choco install flux -y
    choco install argocd-cli -y

    # Secrets
    choco install age -y
    choco install sops -y

    # AI / LLM
    choco install ollama -y
}

function Install-UserApps {
    # Browsers
    choco install googlechrome -y
    choco install firefox -y
    choco install brave -y

    # Communication
    choco install slack -y
    choco install discord -y
    choco install signal -y
    choco install whatsapp -y
    choco install zoom -y

    # Dev GUI tools
    choco install docker-desktop -y
    choco install postman -y
    choco install pgadmin4 -y
    choco install ngrok -y

    # IDEs
    choco install goland -y
    choco install intellijidea -y
    choco install webstorm -y

    # Terminal
    choco install warp -y

    # Productivity
    choco install microsoft-office-deployment -y
    choco install dropbox -y
    choco install obsidian -y
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
