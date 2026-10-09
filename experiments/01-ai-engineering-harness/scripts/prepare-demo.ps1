$ErrorActionPreference = "Stop"
$ExpectedTarget = "C:\Evolium\webinar-experiment-01-live"
$ExperimentRoot = Split-Path -Parent $PSScriptRoot
$Template = Join-Path $ExperimentRoot "template"

if (-not (Test-Path $Template)) { throw "Template not found: $Template" }
if (Test-Path $ExpectedTarget) { throw "Target already exists: $ExpectedTarget. Use reset-demo.ps1 or remove it deliberately." }

New-Item -ItemType Directory -Force -Path $ExpectedTarget | Out-Null
Copy-Item -Path (Join-Path $Template "*") -Destination $ExpectedTarget -Recurse -Force

Push-Location $ExpectedTarget
try {
    git init | Out-Host
    git add .
    git commit -m "demo: baseline" | Out-Host
    git tag demo-baseline
    Write-Host "Demo workspace created: $ExpectedTarget"
    Write-Host "Run: python -m unittest discover -s tests -v"
} finally {
    Pop-Location
}
