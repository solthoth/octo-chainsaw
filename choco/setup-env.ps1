param(
    [string]$Apps = "ALL",
    [bool]$choco = $True
)
function Install-SystemApps
{
    choco install curl -y
    choco install 7zip.install -y   
}
function Install-DevApps
{
    choco install git.install -y
    choco install nodejs.install -y
    choco install notepadplusplus.install -y
    choco install sourcestree -y
    choco install atom -y

}
function Install-UserApps
{
    choco install googlechrome -y
    choco install firefox -y
    choco install adobereader -y
}
function Install-Apps
{
    if($Apps -eq "ALL" -or $Apps -eq "SYS"){
        Install-SystemApps
    }
    if($Apps -eq "ALL" -or $Apps -eq "USER"){
        Install-UserApps
    }
    if($Apps -eq "ALL" -or $Apps -eq "DEV"){
        Install-DevApps    
    }
}
function Run($path)
{
    if($choco) {
        write-host "Installing chocolatey"
        $path = Split-Path $path
        & "$path\install.ps1"
    }
    write-host "Installing apps"
    Install-Apps
    write-host "Done"
}
# Run chocolatey installation first, this will update/install the package manager needed
# for installing all the apps above
$Apps = $Apps.ToUpper()
Run($MyInvocation.MyCommand.Path)