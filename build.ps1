$version  = "1.0"
$distName = "tumblersmith-v$version"
$distDir  = "$PSScriptRoot\dist\$distName"
$zipOut   = "$PSScriptRoot\dist\$distName.zip"

# Clean
if (Test-Path "$PSScriptRoot\dist") { Remove-Item "$PSScriptRoot\dist" -Recurse -Force }
New-Item -ItemType Directory -Path $distDir | Out-Null

# Copy files
New-Item -ItemType Directory -Path "$distDir\Tumblersmith" | Out-Null
Copy-Item "$PSScriptRoot\index.html" "$distDir\Tumblersmith\index.html"

# Write install instructions
@"
Gothic 1 Remake — Tumblersmith v$version
============================================

ONLINE
------
No installation needed — open in any browser:
https://wealdly.github.io/g1r-lockpick-helper/

OFFLINE / ALONGSIDE THE GAME
------------------------------
1. Copy the Tumblersmith\ folder into:
   <Steam>\steamapps\common\Gothic 1 Remake\

2. Open Tumblersmith\index.html in any browser.

Your data is saved automatically in the browser (localStorage).
"@ | Set-Content "$distDir\README.txt" -Encoding UTF8

# Zip
Compress-Archive -Path "$distDir\*" -DestinationPath $zipOut -Force

Write-Host "Built: $zipOut"
