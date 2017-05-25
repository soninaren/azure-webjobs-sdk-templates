$ProgressPreference = "SilentlyContinue"
Add-Type -AssemblyName System.IO.Compression.FileSystem

function LogErrorAndExit($errorMessage, $exception) {    
    Write-Output $errorMessage
    if ($exception -ne $null) {        
        Write-Output $exception|format-list -force
    }    
    Exit
}

function LogSuccess($message) {
    Write-Output $message
}

function Download([string]$url, [string]$outputFilePath) {        
    try {
        Invoke-WebRequest -Uri $url -OutFile $outputFilePath 
        LogSuccess "Download complete for $url"
    } catch {        
        LogErrorAndExit "Download failed for $url" $_.Exception
    }   
}

function Unzip([string]$zipfilePath, [string]$outputpath) {    
    try {
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfilePath, $outputpath)        
        LogSuccess "Unzipped:$zipfilePath"
    }
    catch {
        LogErrorAndExit "Unzip failed for:$zipfilePath" $_.Exception
    }
}

# Main Code Block
try {       
    $rootPath = Get-Location

    $toolsDir = Join-Path $rootPath -ChildPath "\Tools\"   
    # Start with a clean slate
    if (Test-Path $toolsDir) {
        Remove-Item $toolsDir -Recurse -Confirm:$false    
    }

    New-Item -ItemType Directory $toolsDir

    # Download dotnet CLI
    $dotnetCliDownloadUrl = "https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/2.0.0/dotnet-dev-win-x86.latest.zip"
    $dotnetCliZip = Join-Path $toolsDir -ChildPath "dotnet.zip"
    Download $dotnetCliDownloadUrl $dotnetCliZip    

    # Unzip dotnet CLI
    $cliDir = Join-Path $toolsDir -ChildPath "\cli\"
    New-Item -ItemType Directory $cliDir
    Unzip $dotnetCliZip $cliDir    
        
    # Download code formatter tool
    $codeFormatterZip = Join-Path $toolsDir -ChildPath "codeFormatter.zip"
    $codeFormatterDownloadUrl = "https://github.com/dotnet/codeformatter/releases/download/v1.0.0-alpha6/CodeFormatter.zip"    
    Download $codeFormatterDownloadUrl $codeFormatterZip    

    # Unzip code formatter tool    
    Unzip $codeFormatterZip $toolsDir
    
    # downloading nuget.exe
    $nugetUrl = "https://dist.nuget.org/win-x86-commandline/v4.1.0/nuget.exe"
    Download $nugetUrl "$toolsDir\nuget.exe"
}
catch {
    LogErrorAndExit "UnKnown Error" $_.Exception
}