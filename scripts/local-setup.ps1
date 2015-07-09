# M. Duiker - Tahzoo
#
# This script contains functions which requires PowerShell 4 (Windows 8.1 or Windows Server 2012 R2)
# If running this script is not allowed the ExecutionPolicy is probably set to Restricted.
# Execute the following command to allow running local scripts:
# Set-ExecutionPolicy RemoteSigned

# Global variables
# These variables require to be modified for each environment. 

# downloads:


# Import scripts
. "$PSScriptRoot\include\Log.ps1"
& "$PSScriptRoot\include\Carbon\Import-Carbon.ps1"


function CheckPrerequisites()
{
    $windowsFeatures = Test-WindowsFeature -Name Web-Asp-Net -ErrorAction SilentlyContinue
    if (-not ($windowsFeatures))
    {
        Log "Please download and install 'Remote Server Administration Tools for Windows 8'.
            A browser window has been opened to download the tools. 
            Rerun this script after the installation." "Yellow"
        Invoke-Expression "cmd.exe /C start https://www.microsoft.com/en-us/download/details.aspx?id=28972"
        
        return $false
    }

    Import-Module WebAdministration -Force

    return $true
}

function CreateAppPool($appPoolName)
{
    if (!(Test-Path "IIS:\AppPools\$appPoolName"))
    {
        Log "Creating IIS application pool: $appPoolName..."
        New-WebAppPool $appPoolName -Force
    }
    else
    {
        Log "Application pool $appPoolName already exists."   
    }
}

function CreateWebsite($webAppName, $physicalPath, $appPool, $hostName)
{
    if (!(Test-Path $physicalPath))
    {
        Log "Creating website directory: $physicalPath..."
        New-Item -ItemType Directory -Force -Path $physicalPath
    }
    
    if (!(Test-Path "IIS:\Sites\$webAppName"))
    {
        Log "Creating IIS website: $webAppName..."
        New-Website -Name $webAppName -PhysicalPath $physicalPath -ApplicationPool $appPool -HostHeader $hostName -Force
    }
    else
    {
        Log "Website $webAppName already exists."
    }
}


function Main()
{
    Log 'Start local setup'
    if ((CheckPrerequisites) -eq $false)
    {
        Exit 1
    } 
    Log 'Completed local setup'
}

# Start
Main