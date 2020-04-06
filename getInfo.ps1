$winVersion = Get-WmiObject Win32_OperatingSystem
$psVersion = Get-Host | Select-Object Version


Write-Host "This computer is running:"
Write-Host ("Windows {0} - Build {1}" -f $winVersion.Version, $winVersion.BuildNumber)
Write-Host ("PowerShell {0}.{1}" -f $psVersion.Version.Major, $psVersion.Version.Minor)