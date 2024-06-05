# Defining the path of the directory to clean
$directoryPath = "C:\ProgramData\Apple Computer\iTunes\adi"

# If the directory exists, delete all files in it
if (Test-Path $directoryPath) {
    Remove-Item -Path "$directoryPath\*" -Force -Recurse
} else {
    Write-Host "The directory $directoryPath does not exist."
}

# Restart iTunes
$itunesProcess = Get-Process -Name iTunes -ErrorAction SilentlyContinue
if ($itunesProcess) {
    Stop-Process -Name iTunes -Force
    Start-Process "C:\Program Files\iTunes\iTunes.exe"
} else {
    Write-Host "iTunes is not running."
}
